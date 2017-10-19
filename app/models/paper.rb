class Paper < ApplicationRecord
  belongs_to :user
  has_many :versions, inverse_of: :paper
  accepts_nested_attributes_for :versions, reject_if: :all_blank, allow_destroy: true
end
