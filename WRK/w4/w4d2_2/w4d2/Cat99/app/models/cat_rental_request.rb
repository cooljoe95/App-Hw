require 'byebug'
# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"] }
  validate :valid_range

  belongs_to :cat, dependent: :destroy



  private
  def valid_range

    return errors[:range]<<"Range is wrong" if self.start_date > self.end_date
    debugger
    all_cats = CatRentalRequest
                # .includes(:cats)
                .where("cat_id = ? AND status = ?", self.cat_id, "APPROVED")
                # .includes(:start_date, :end_date, :cat_id)
    all_cats.each do |request|
      if request.id != self.id
          return errors[:request]<<"Request Denied" unless self.start_date > request.end_date or self.end_date < request.start_date
      end
    end
  end

end
