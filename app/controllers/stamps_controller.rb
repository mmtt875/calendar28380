class StampsController < ApplicationController
  before_action :sign_in_required

  def new
    @stamp = Stamp.new
  end

  def create
    stamp = Stamp.find_or_initialize_by(calendar_id: params[:calendar_id], date: params[:date], stamp_checked: true)

    unless stamp.persisted?
      stamp.save!
    end

    redirect_to calendar_path(params[:calendar_id])
  end

  def destroy
    stamp = Stamp.find_by(calendar_id: params[:calendar_id], date: params[:date])

    if stamp.present?
      stamp.destroy!
    end

    redirect_to calendar_path(params[:calendar_id])
  end
end
