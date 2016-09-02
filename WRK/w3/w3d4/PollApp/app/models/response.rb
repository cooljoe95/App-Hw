# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#
class Response < ActiveRecord::Base

  validates(:user_id, :answer_choice_id, presence: true)
  validate(:not_author_response, :not_duplicate_response)

  belongs_to(
    :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def author_answer?
    question.poll.author.id == self.user_id
  end

  private
  def not_author_response
    if author_answer?
      errors[:base] << "author can't answer own poll"
    end
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:base] << "can't make duplicate responses"
    end
  end

end
