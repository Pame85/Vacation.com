# app/models/booking.rb
class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validate :check_in_cannot_be_in_the_past
  validate :check_out_cannot_be_before_check_in
  validate :check_booking_overlap

 attribute :check_in, :date

  private

  def check_in_cannot_be_in_the_past
    errors.add(:check_in, "can't be in the past") if check_in.present? && check_in < Date.today
  end

  def check_out_cannot_be_before_check_in
    errors.add(:check_out, "can't be before check-in date") if check_out.present? && check_out < check_in
  end

  def check_booking_overlap
    overlapping_booking = listing.booking.where('(check_in <= ? AND check_out >= ?) OR (check_in <= ? AND check_out >= ?)',
                                                   check_in, check_in,
                                                   check_out, check_out)
    errors.add(:base, "Booking dates overlap with existing bookings") if overlapping_bookings.exists?
  end
end
