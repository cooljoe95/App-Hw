# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  title      :string           not null
#  url        :string
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  sub_id     :integer          not null
#

class Post < ActiveRecord::Base

  validates :title, :author, :sub, presence: true

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  belongs_to :sub

end
