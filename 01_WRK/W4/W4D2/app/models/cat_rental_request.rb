# create_table :cat_rental_requests do |t|
#   t.integer :cat_id, null: false
#   t.date :start_date, null: false
#   t.date :end_date, null: false
#   t.string :status, null: false, default: 'PENDING'

class CatRentalRequest < ApplicationRecord
  STATUSES = %w(
    APPROVED
    DENIED
    PENDING
  )

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates_inclusion_of :status, in: STATUSES

  validate :does_not_overlap_approved_request

  def overlapping_requests
    if self.id
      CatRentalRequest.where.not(id: self.id)
    else
      CatRentalRequest.all
    end
  end

  def overlapping_approved_requests
    # some_request.overlapping_approved_requests
    # calls overlapping_requests
    new_start = self.start_date
    new_end = self.end_date

     overlapping_requests.where(cat_id: self.cat_id).where(" '#{new_end}' >= start_date AND end_date >= '#{new_start}'")
  end

  def does_not_overlap_approved_request
    # sub-methods return any overlapping results
    # this method returns false if any exist
    overlapping_approved_requests.none? {|request| request.status == "APPROVED"}
  end


###########################

  belongs_to :cat




end
