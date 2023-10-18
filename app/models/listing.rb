class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews, as: :reviewable, dependent: :destroy
end
