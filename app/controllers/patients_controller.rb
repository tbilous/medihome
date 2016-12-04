class PatientsController < ApplicationController
  include Serialized

  before_action :authenticate_user!, except: [:show, :index]

  def create
    @patient = current_user.patients.create(strong_params)
    render_json @patient
  end

  def set_default
  end

  private
  def strong_params
    params.require(:patient).permit(:name, :birth, :comment, :sex)
  end
end
