class CalendarsController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def index
    return redirect_to new_user_session_path unless current_user.present?

    @calendars = Calendar.where(user_id: current_user.id)
  end

  def show
    @calendar = Calendar.find_by(id: params[:id])
  end

  def new
    return redirect_to root_path if current_user.blank?

    @calendar = current_user.calendars.build
  end

  def create
    # params.user_id = current_user.id
    calendar = Calendar.new(calendar_params)

    if calendar.invalid?
      byebug
      # return redirect_to
    end

    calendar.save!

    redirect_to calendar
  end

  private

  def calendar_params
    params.require(:calendar).permit(
      :user_id,
      :title
    )
  end
end
