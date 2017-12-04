class Paper < ApplicationRecord
  belongs_to :user
  has_many :versions, inverse_of: :paper
  has_many :paper_requests
  has_many :assignments
  accepts_nested_attributes_for :versions, reject_if: :all_blank, allow_destroy: true

end
