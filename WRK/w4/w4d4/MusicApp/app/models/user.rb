# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }

  # Wondered why we used after_initialize in the code and Daniel answered
  # Life begins at Initialization
  after_initialize :ensure_session_token
  attr_reader :password

  # Second guessed myself on this one
  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  # Did not get anything past the first line.
  # Forgot to save, no matter how much Daniel reminded us to yesterday!
  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  # Did not set the session token
  # I knew to get the session token unless there was something already there,
  # but didn't assign it when it returned.
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return user if user.is_password?(password)
    nil
  end

end
