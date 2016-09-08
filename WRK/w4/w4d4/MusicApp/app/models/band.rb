# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Band < ActiveRecord::Base

  validates :name, presence: true

  has_many(
    :albums,
    dependent: :destroy,
    class_name: "Album",
    foreign_key: :band_id,
    primary_key: :id
  )

  has_many(
    :tracks,
    through: :albums,
    source: :tracks
  )

end
