# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  album_name :string           not null
#  album_type :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base

  validates :band_id, :album_name, :album_type, presence: true
  validates :album_type, inclusion: { in: ["live", "recorded"] }
  validate :type_correct

  belongs_to(
    :band,
    class_name: "Band",
    foreign_key: :band_id,
    primary_key: :id
  )

  has_many(
    :tracks,
    dependent: :destroy,
    class_name: "Track",
    foreign_key: :album_id,
    primary_key: :id
  )

  def type_correct
    if self.band_id == 0
      errors.add("Band_id is expecting a positive number, Artist is not defined")
    end
  end

end
