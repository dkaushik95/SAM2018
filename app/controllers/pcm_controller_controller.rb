class PcmControllerController < ApplicationController
  def index
    @paper = Paper.all
  end
end
