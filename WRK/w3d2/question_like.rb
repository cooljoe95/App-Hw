require_relative 'question'
require_relative 'questions_db_connection'
require_relative 'questionsdatabase'


class Question_Like < ModelBase

  attr_reader :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    # like = QuestionsDBConnection.instance.execute(<<-SQL, id)
    #   SELECT
    #     *
    #   FROM
    #     question_likes
    #   WHERE
    #     id = ?
    # SQL
    #
    # Question_Like.new(like[0])
    super
  end

  def self.likers_for_question_id(question_id)

    likers = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_likes
      JOIN
        users ON users.id = question_likes.user_id
      WHERE
        question_id = ?
    SQL

    likers.map { |liker| User.new(liker) }
  end

  def self.num_likes_for_question_id(question_id)

    likers = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*) count
      FROM
        question_likes
      JOIN
        users ON users.id = question_likes.user_id
      WHERE
        question_id = ?
    SQL

    likers.first["count"]

  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL

    questions.map { |question| Question.new(question) }

  end

  def self.most_liked_questions(n)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        question_likes
      JOIN
        questions ON questions.id = question_likes.question_id
      GROUP BY
        question_id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
    SQL

    questions.map { |question| Question.new(question) }
  end

end

if __FILE__ == $PROGRAM_NAME
  p Question_Like.find_by_id(2)
end
