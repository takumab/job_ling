class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
  	@jobs = Job.all.order("created_at DESC")
  end

  def new
  	@job = Job.new
  end

  def show
  end

  def edit
  end

  def create
		@job = Job.new(job_params)  	

		if @job.save
			redirect_to @job, notice: "Job successfully created!"
		else
			render 'new'
		end
  end

  def update
  	@job = Job.find(params[:id])

  	if @job.update(job_params)
  		redirect_to @job
  	else
  		render 'edit'
  	end
  end

  def destroy
  end

  private 

  def set_job
  	@job = Job.find(params[:id])
  end

  def job_params
  	params.require(:job).permit(:position, :description, :company, :city)
  end
end
