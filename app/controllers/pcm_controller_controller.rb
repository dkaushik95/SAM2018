class PcmControllerController < ApplicationController
	# before_action :find_paper, only:[:show, :edit, :update, :destroy]
	before_action :find_vars
	before_action :authenticate_user!
	before_action do 
		redirect_to new_user_session_path unless current_user && current_user.pcm?
  	end
  def index
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

  def submit_review
    paper = params[:paper]
    review = params[:review]
    rating = params[:rating]
    if Review.create({paper_id: paper, review: review, rating: rating, user_id: current_user.id}).save()
      redirect_to pcm_controller_index_path, {notice: "Submitted"}
      pap = Paper.find(paper)
      pap.status = "reviewed"
      pap.save()
      Assignment.where(user_id: current_user.id, paper_id: paper).delete_all
    else
      redirect_to pcm_controller_review_path(paper), {error: "Error"}
    end
  end

  def review
    @review
    @paper = Paper.find(params[:paper])
  end

  def find_vars
    @assignments = Assignment.where(user_id: current_user)
  	@paper_request = PaperRequest.where(user_id: current_user)
  	if @paper_request.length == 0
  		@requested = []
  		@toberequested = Paper.where(status: "initial")
  	else
  		@requested = Paper.where("id IN (?)", @paper_request.map(&:paper_id))
  		@toberequested = Paper.where(" id NOT IN (?)", @paper_request.map(&:paper_id))
  	end
    @reviewed = Review.where(user_id: current_user.id)
  end
end