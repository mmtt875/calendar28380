class Stamp < ApplicationRecord
  belongs_to :calendars
  belongs_to :users
end
