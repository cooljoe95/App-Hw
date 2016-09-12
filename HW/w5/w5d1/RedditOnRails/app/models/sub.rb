# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  moderator_id :integer          not null
#  description  :text             not null
#  title        :string           not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Sub < ActiveRecord::Base

  validates :moderator, :description, :title , presence: true

  belongs_to(
    :moderator,
    class_name: "User",
    foreign_key: :moderator_id,
    primary_key: :id
  )

  has_many :posts

end
