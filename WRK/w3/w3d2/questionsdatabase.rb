
require_relative "questions_db_connection"

class ModelBase


  def self.find_by_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{ self.to_s[-1] == "y"  ? self.to_s.downcase[0...-1] += "ies": self.to_s.downcase[0..-1] += "s" }
      WHERE
        id = ?
    SQL

    self.new(found[0])
  end


end
