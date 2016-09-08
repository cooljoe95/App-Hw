# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string
#  session_token   :string
#

class User < ActiveRecord::Base

  validates :password, length: { minimum: 6 }
  validates :username, presence: true
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true

  attr_reader :password

  has_many :links
  has_many :comments

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def session_token
    @session_token ||= SecureRandom.urlsafe_base64
  end
end
