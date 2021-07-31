class CliniciansController < ApplicationController

  def index
    @clinicians = Clinician.all
  end

  def show
    @clinician = Clinician.find(params[:id])
  end
end
