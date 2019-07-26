class DivesController < ApplicationController
  attr_writer :dive
  private :dive=

  def show
  end

  def new
    self.dive = Dive.new
  end

  def create
    self.dive = Dive.new(dive_params)
    if dive.save
      redirect_to dive
    else
      render action: :new
    end
  end

  private def dive
    @dive ||= Dive.find(params[:id])
  end
  helper_method :dive

  private def dive_params
    params.require(:dive).permit(:i_have_been_responsible)
  end
end
