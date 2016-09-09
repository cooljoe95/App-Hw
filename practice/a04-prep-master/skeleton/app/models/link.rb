# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base

  validates :title, presence: true
  validates :url, presence: true
  validates :user

  belongs_to :user

  has_many(
    :comments,
    through: :user,
    source: :comments
  )

end
