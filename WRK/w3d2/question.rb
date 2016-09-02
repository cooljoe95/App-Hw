require 'sqlite3'
require_relative 'user'
require_relative 'reply'
require_relative 'questions_db_connection'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'questionsdatabase'

class Question < ModelBase

  attr_reader :id
  attr_accessor :body, :title, :user_id

  def initialize(options = {})
    @id = options['id']
    @user_id = options['user_id']
    @title = options['title']
    @body = options['body']
  end

  def self.find_by_id(id)
    # question = QuestionsDBConnection.instance.execute(<<-SQL, id)
    #   SELECT
    #     *
    #   FROM
    #     questions
    #   WHERE
    #     id = ?
    # SQL
    #
    # Question.new(question[0])
    super
  end

  def self.find_by_author(author_id)
    question = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL

    question.map { |result| Question.new(result) }
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def author
    User.find_by_id(@user_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

  def save
    return update if @id
    return if @user_id == nil or @title == nil
    QuestionsDBConnection.instance.execute(<<-SQL, @user_id, @title, @body)
      INSERT INTO
        questions (user_id, title, body)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    return save unless @id
    return if @user_id == nil or @title == nil
    QuestionsDBConnection.instance.execute(<<-SQL, @user_id, @title, @body)
      UPDATE
        questions
      SET
        user_id = ?, title = ?, body = ?
      WHERE
        id = ?
    SQL
  end

end


# p User.find_by_id(2).followed_questions
# p Question.find_by_id(3)
# p QuestionFollow.find_by_id(2)
# p QuestionLike.find_by_id(2)
# p Question.find_by_author(3)
# p Reply.find_by_user_id(1)
# p Reply.find_by_question_id(1)
# p User.find_by_name("Danielle", "Z")[0].authored_replies
# p Question.find_by_id(1).followers
# p Question.find_by_id(1).replies


if __FILE__ == $PROGRAM_NAME
  p Question.find_by_id(4)
end
