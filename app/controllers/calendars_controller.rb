class CalendarsController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def index
  end

  def show
    @calendars = Calendar.all
  end
end
