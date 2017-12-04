class PcmControllerController < ApplicationController
	# before_action :find_paper, only:[:show, :edit, :update, :destroy]
	before_action :find_vars
	before_action :authenticate_user!
	before_action do 
		redirect_to new_user_session_path unless current_user && current_user.pcm?
  	end
  def index
  	@assignments = []
  end

  def request_paper
  	if PaperRequest.create({user_id: current_user.id, paper_id: request.params[:paper]}).save()
  		redirect_to '/pcm_controller/index', {notice: "Done!"}
  	else
  		redirect_to "/pcm_controller/index", {error: "Error"}
  	end
  end

  def delete_request
  	if PaperRequest.where("user_id == #{current_user.id} and paper_id == #{request.params[:paper]}").destroy_all
  		redirect_to '/pcm_controller/index', {notice: "Done!"}
  	else
  		redirect_to '/pcm_controller/index', {error: "Error!"}
  	end
  end

  def find_vars
  	@paper_request = PaperRequest.where(user_id: current_user)
  	if @paper_request.length == 0
  		@requested = []
  		@toberequested = Paper.all
  	else
  		@requested = Paper.where("id IN (?)", @paper_request.map(&:paper_id))
  		@toberequested = Paper.where(" id NOT IN (?)", @paper_request.map(&:paper_id))
  	end
  end
end