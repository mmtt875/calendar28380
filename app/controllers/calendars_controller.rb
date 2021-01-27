class CalendarsController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def index
    @calendars = Calendar.where(user_id: current_user.id) if current_user.present?
  end

  def show
    @calendar = Calendar.find_by(id: params[:id])
    day = params[:start_date].nil? ? Time.zone.today : Date.parse(rapams[:start_date])
    beginning_date = day.beginning_of_month.beginning_of_week
    end_date = day.end_of_month.end_of_week
    @stamps = @calendar.stamps.where(date:beginning_date..end_date)
  end

  def new
    return redirect_to root_path if current_user.blank?

    @calendar = current_user.calendars.build
  end

  def create
    calendar = Calendar.new(calendar_params)

    if calendar.invalid?
      # TODO: バリデーションエラーの時の処理を書く
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
