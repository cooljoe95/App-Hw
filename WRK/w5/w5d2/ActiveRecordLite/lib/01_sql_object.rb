require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    # ...
    return @columns if @columns
    ar_of_columns = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name};
      --LIMIT 0 to ensure that it does not return records, just the columns
    SQL
    ar_of_columns = ar_of_columns[0] # could have called ".first" on line 11
    ar_of_columns.each_with_index do |el, i| # map!(&:to_sym) does the same thing
      ar_of_columns[i] = el.to_sym
    end
    @columns = ar_of_columns
  end

  def self.finalize!

    columns.each do |method|
      method = method.to_s
      define_method(method){ # I am able to send in a symbol, did not need to make it a string
        self.attributes[method.to_sym]
      }

      define_method("#{method}=") do |val|
        self.attributes[method.to_sym] = val
      end
    end

  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    if @table_name # Same could have been done on one line with ||
      @table_name
    else
      self.to_s.tableize
    end
  end

  def self.all
    # ...
    hash = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name};
    SQL
    self.parse_all(hash)
  end

  def self.parse_all(results)
    # ...
    results = results.map { |hash| self.new(hash) }
  end

  def self.find(id)
    # ...
    result = DBConnection.execute(<<-SQL, id)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
      WHERE
        #{self.table_name}.id = ?
      LIMIT
        1;
    SQL
    return self.new(result[0]) if result[0]
    nil
  end

  def initialize(params = {})
    # ...
    if params == {}
      return self
    end
    hash = send(:attributes)

    params.each do |attr_name, value|
      if self.class.columns.include?(attr_name.to_sym)
        attr_name = "#{attr_name}="
        attr_name = attr_name.to_sym
        send(attr_name, value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end

    self
  end

  def attributes
    # ...
    @attributes = {} if @attributes.nil?
    @attributes
  end

  def attribute_values
    # ...
    self.class.columns.map { |col| send(col.to_sym) }
  end

  def insert
    # ...
    cols = self.class.columns
    question_marks = ["?"] * cols.length
    question_marks = question_marks.join(", ")
    col_names = cols.join(", ")
    values =  attribute_values

    self.id = DBConnection.last_insert_row_id
    values[0] = self.id

    ar_of_columns = DBConnection.execute(<<-SQL, *values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks});
    SQL

  end

  def update
    # ...
    cols = self.class.columns
    col_names = cols.join(" = ?, ").concat(" = ?")
    values =  attribute_values

    ar_of_columns = DBConnection.execute(<<-SQL, *values, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{col_names}
      WHERE
        id = ?;
    SQL
  end

  def save
    # ...
    if self.id == nil
      insert
    else
      update
    end
  end
end
