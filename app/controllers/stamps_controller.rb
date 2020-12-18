class StampsController < ApplicationController
  before_action :sign_in_required

  def new
    @stamp = Stamp.new
  end

end
