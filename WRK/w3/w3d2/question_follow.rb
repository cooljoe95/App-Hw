require_relative 'question.rb'
require_relative 'questions_db_connection'
require_relative 'questionsdatabase'


class Question_Follow < ModelBase

  attr_reader :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    # follow = QuestionsDBConnection.instance.execute(<<-SQL, id)
    #   SELECT
    #     *
    #   FROM
    #     question_follows
    #   WHERE
    #     id = ?
    # SQL
    #
    # Question_Follow.new(follow[0])
    super
  end

  def self.followers_for_question_id(question_id)

    followers = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        users ON users.id = question_follows.user_id
      WHERE
        question_id = ?
    SQL

    followers.map { |follower| User.new(follower) }
  end

  def self.followed_questions_for_user_id(user_id)

    questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        questions ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
    SQL

    questions.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        question_follows
      JOIN
        questions ON questions.id = question_follows.question_id
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
  p Question_Follow.find_by_id(4)
end
