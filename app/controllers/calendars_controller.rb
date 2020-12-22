class CalendarsController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def index
    byebug
    current_user
    Calendar.where(user_id: params[:user_id])
  end

  def show
    @calendar = Calendar.find_by(id: params[:id])
  end

  def create
  end
end
