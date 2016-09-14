require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    # ...
    through_options = self.assoc_options[through_name]
    define_method(name) do
      source_class = through_options.model_class
      source_options = source_class.assoc_options[source_name]

      select_name = source_options.model_class.table_name
      from_name = source_class.table_name
      join_left = source_options.foreign_key
      join_right = source_options.primary_key
      query = self.send(through_options.foreign_key)

      ar_of_columns = DBConnection.execute2(<<-SQL)
        SELECT
          #{select_name}.*
        FROM
          #{from_name}
        JOIN
          #{select_name} ON #{from_name}.#{join_left} = #{select_name}.#{join_right}
        WHERE
          #{from_name}.#{through_options.primary_key} = #{query};
      SQL
      source_options.model_class.parse_all(ar_of_columns)[1]
    end
  end
end
