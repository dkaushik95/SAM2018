class PccController < ApplicationController
	def index
		@assigned_papers = Paper.where(status: "assigned")
		@papers = Paper.where(status: "initial")
		@reviewed = Paper.where(status: "reviewed")
		@accepted = Paper.where(status: "accepted")
	end

	def show_paper
		@users = User.where(role: "pcm")
		@paper = Paper.find(params[:id])
		@requests = PaperRequest.where(paper_id: params[:id])
		assignments = Assignment.where(paper_id: params[:id])
		@assignments = assignments.map(&:user_id)
	end

	def show_review
		@paper = Paper.find(params[:paper])
		@reviews = Review.where(paper_id: @paper.id)
	end

	def accept_paper
		paper = Paper.find(params[:paper])
		paper.status = "accepted"
		if paper.save()
			redirect_to pcc_index_path, {notice: "Paper Accepted!"}
		else
			redirect_to pcc_index_path, {error: "Error while accepting paper"}
		end
	end

	def reject_paper
		paper = Paper.find(params[:paper])
		paper.status = "rejected"
		if paper.save()
			redirect_to pcc_index_path, {notice: "Paper Rejected!"}
		else
			redirect_to pcc_index_path, {error: "Error while rejecting paper"}
		end
	end

	def assign_paper
		pcm_id = params[:user]
		paper_id = params[:paper]
		if Assignment.create({paper_id: paper_id, user_id: pcm_id}).save()
			paper = Paper.find(paper_id)
			paper.status = "assigned"
			paper.save
			PaperRequest.where(paper_id: paper_id).destroy_all
			redirect_to '/pcc/index', {notice: "Paper assigned!"}
		else
			redirect_to '/pcc/index', {error: "Error assigning paper"}
		end
	end
end