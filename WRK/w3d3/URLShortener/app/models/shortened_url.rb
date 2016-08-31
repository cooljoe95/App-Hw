# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'SecureRandom'
require 'byebug'
class ShortenedUrl < ActiveRecord::Base

  validates(:long_url, presence: true, uniqueness: true)
  validates(:short_url, presence: true, uniqueness: true)
  validates(:user_id, presence: true)

  belongs_to :submitter,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  has_many :visits,
    class_name: 'Visit',
    foreign_key: :visited_url_id,
    primary_key: :id

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user

  def self.random_code
    url = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: url)
      url = SecureRandom.urlsafe_base64
    end
    url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    self.create!(user_id: user["id"], long_url:long_url, short_url: self.random_code)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visits.select(:user_id).where( 'created_at >= ?', 10.minutes.ago ).distinct.count
  end


end











#
