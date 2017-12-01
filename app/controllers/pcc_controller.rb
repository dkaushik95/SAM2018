class PccController < ApplicationController

  before_action :authenticate_user!
  before_action do 
    redirect_to new_user_session_path unless current_user && current_user.pcc?
  end
  def index
  	@papers = Paper.all
  end

  def show_paper
  	@paper = Paper.find(params[:id])
  end
end
