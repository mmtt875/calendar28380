class Calendar < ApplicationRecord
  belongs_to :users
  has_many :stamps
end
