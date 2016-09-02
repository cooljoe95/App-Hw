# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base

  validates(:text, :poll_id, presence: true)

  has_many(
    :answer_choices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id
  )

  belongs_to(
    :poll,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )

  def results
    choices = answer_choices.includes(:responses)

    counts = Hash.new(0)
    choices.each do |choice|
      counts[choice.text] += choice.responses.length
    end

    counts
  end

  def better_results
    # query = <<-SQL
    #   SELECT
    #     answer_choices.*, COUNT(responses.id)
    #   FROM
    #     answer_choices
    #
    #    LEFT OUTER JOIN responses ON responses.answer_choice_id = answer_choices.id
    #
    #    WHERE answer_choices.question_id = :question_id
    #
    #     GROUP BY answer_choices.id
    # SQL

    hash = answer_choices.joins("LEFT OUTER JOIN  responses ON responses.answer_choice_id = answer_choices.id")
                  .where(question_id: self.id)
                  .group("answer_choices.id")
                  .count

            # .where(question_id: :id)
            # .group(self.id)
            # .count

    counts = {}
    hash.each do |id, freq|
      q = answer_choices.where(id: id).first.text
      counts[q] = freq
    end
    counts
    # TODO: make it work using find_by_sql
    # self.class.find_by_sql(query, question_id: self.id)
  end


end
