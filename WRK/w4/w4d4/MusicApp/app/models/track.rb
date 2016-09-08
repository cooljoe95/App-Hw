# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  track_name :string           not null
#  track_type :string
#  lyrics     :text
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base

  validates :album_id, :track_name, presence: true
  validates :track_type, inclusion: { in: ["bonus", "regular"] }, allow_nil: true
  validate :type_correct

  belongs_to(
    :album,
    class_name: "Track",
    foreign_key: :album_id,
    primary_key: :id
  )

  def type_correct
    if self.album_id == 0
      errors.add(self.album_id.to_s, "is not an option")
    end
  end

end
