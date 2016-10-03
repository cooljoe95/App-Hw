# == Schema Information
#
# Table name: benches
#
#  id          :integer          not null, primary key
#  description :text             not null
#  lat         :float            not null
#  lng         :float            not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Bench < ActiveRecord::Base
  validates :description, :lat, :lng, presence: true
end
