# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  age         :integer          not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)
#  description :text             not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Cat < ActiveRecord::Base

  validates :birth_date, :color, :name, :description, presence: true
  validates :color, inclusion: { in: ["Black", "White", "Orange", "Brown"] }
  validates :sex, inclusion: { in: ["M", "F"] }

  has_many :cat_rental_requests




end
