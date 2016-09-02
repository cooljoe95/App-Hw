require_relative 'user'
require_relative 'question'
require_relative 'questions_db_connection'
require_relative 'questionsdatabase'

class Reply < ModelBase

  attr_reader :id
  attr_accessor :body, :parent, :author, :subject

  def initialize(options = {})
    @id = options['id']
    @parent = options['parent']
    @subject = options['subject']
    @author = options['author']
    @body = options['body']
  end

  def self.find_by_id(id)
    #
    # return nil if id.nil?
    #
    # reply = QuestionsDBConnection.instance.execute(<<-SQL, id)
    #   SELECT
    #     *
    #   FROM
    #     replies
    #   WHERE
    #     id = ?
    # SQL
    #
    # Reply.new(reply[0])
    super
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(subject_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, subject_id)
      SELECT
        *
      FROM
        replies
      WHERE
        subject = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def author
    User.find_by_id(@author)
  end

  def question
    Question.find_by_id(@subject)
  end

  def parent_reply
    Reply.find_by_id(@parent)
  end

  def child_replies
    replies = QuestionsDBConnection.instance.execute(<<-SQL, @subject, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        subject = ? AND parent = ?
    SQL

    replies.map { |reply| Reply.new(reply) }

  end

  def save
    return update if @id
    return if @subject == nil or @author == nil or @body == nil
    QuestionsDBConnection.instance.execute(<<-SQL, @subject, @parent, @author, @body)
      INSERT INTO
        replies (subject, parent, author, body)
      VALUES
        (?, ?, ?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    return save unless @id
    return if @subject == nil or @author == nil or @body == nil
    QuestionsDBConnection.instance.execute(<<-SQL, @subject, @parent, @author, @body, @id)
      UPDATE
        replies
      SET
        subject = ?, parent = ?, author = ?, body = ?
      WHERE
        id = ?
    SQL
  end

end

if __FILE__ == $PROGRAM_NAME
  p Reply.find_by_id(2)
end
