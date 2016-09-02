# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

  validates(:user_name, presence: true, uniqueness: true)

  has_many(
    :responses,
    class_name: 'Respond',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :authored_polls,
    class_name: 'Poll',
    foreign_key: :author_id,
    primary_key: :id
  )

  def completed_polls
    <<-SQL
      SELECT
        polls.title, COUNT(responses.id) AS responses_from_user
      FROM
        polls
      JOIN
        questions ON polls.id = questions.poll_id
      JOIN
        answer_choices ON answer_choices.question_id = questions.id
      JOIN
        responses ON responses.answer_choice_id = answer_choices.id
      JOIN
        users ON responses.user_id = users.id
      WHERE
        users.id = 4
      GROUP BY
        polls.id
      HAVING
        COUNT(questions.id) = (
          SELECT
            COUNT(questions.id)
          FROM
            questions
          WHERE
            questions.poll_id = polls.id
        )

    SQL

  end

end
