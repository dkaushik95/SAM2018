class PccController < ApplicationController
	def index
		@assigned_papers = Paper.where(status: "assigned")
		@papers = Paper.where(status: "initial")
	end

	def show_paper
		@users = User.where(role: "pcm")
		@paper = Paper.find(params[:id])
		@requests = PaperRequest.where(paper_id: params[:id])
		assignments = Assignment.where(paper_id: params[:id])
		@assignments = assignments.map(&:user_id)
	end

	def assign_paper
		pcm_id = params[:user]
		paper_id = params[:paper]
		if Assignment.create({paper_id: paper_id, user_id: pcm_id}).save()
			paper = Paper.find(paper_id)
			paper.status = "assigned"
			paper.save
			PaperRequest.where(paper_id: paper_id).destroy_all
			redirect_to '/pcc/index', {notice: "Done!"}
		else
			redirect_to '/pcc/index', {error: "Error!"}
		end
	end
end