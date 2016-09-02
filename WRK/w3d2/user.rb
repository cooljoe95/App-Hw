require_relative 'question'
require_relative 'reply'
require_relative 'questions_db_connection'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'questionsdatabase'


class User < ModelBase

  attr_reader :id
  attr_accessor :fname, :lname

  def initialize(options = {})
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_id(id)
    # user = QuestionsDBConnection.instance.execute(<<-SQL, id)
    #   SELECT
    #     *
    #   FROM
    #     users
    #   WHERE
    #     id = ?
    # SQL
    #
    # User.new(user[0])
    super
  end

  def self.find_by_name(fname, lname)
    users = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? and lname = ?
    SQL

    users.map { |user| User.new(user) }
  end

  def authored_questions
    Question.find_by_author(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def avg_karma
    avg = QuestionsDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        CAST (COUNT(DISTINCT(question_likes.id)) AS FLOAT)/
        COUNT(DISTINCT(questions.id)) avg
      FROM
        questions
      LEFT OUTER JOIN
        question_likes ON question_likes.question_id = questions.id
      WHERE
        questions.user_id = ?
      GROUP BY
        questions.user_id

    SQL

    avg.first['avg']
  end

  def save
    return update if @id
    return if @fname == nil or @lname == nil
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    return save unless @id
    return if @fname == nil or @lname == nil
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end

end


if __FILE__ == $PROGRAM_NAME
  p User.find_by_id(1)
end
