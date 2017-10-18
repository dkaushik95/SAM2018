class PapersController < ApplicationController
  before_action :find_paper, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    # @papers = Paper.where(user_id: current_user)
    @papers = Paper.where(user_id: current_user)
  end

  def show
  end

  def new
    @paper = current_user.papers.build
  end

  def create
    @paper = current_user.papers.build(paper_params)
    if @paper.save
      redirect_to @paper
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @paper.update
      redirect_to @paper
    else
      render 'edit'
    end
  end

  def destroy
    @paper.destroy
    redirect_to papers_path
  end

  private

  def find_paper
    @paper = Paper.find(params[:id])
  end
  def paper_params
    # TODO make the model params here
    params.require(:paper).permit(:name, :author, :contact, :format)
  end
end