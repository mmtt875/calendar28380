class Stamp < ApplicationRecord
  belongs_to :calendar

  def start_time
    date.to_datetime
  end
end
