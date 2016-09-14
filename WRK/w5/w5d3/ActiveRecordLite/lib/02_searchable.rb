require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    # ...
    string = "" #Can be done in one line if we map the keys, and join them with AND
    vals = []
    params.each do |key, val|
      string.concat("#{key} = ? AND ")
      vals << val
    end
    string = string[0..-5]
    obj = DBConnection.execute(<<-SQL, *vals)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{string}
    SQL

    self.parse_all(obj)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
