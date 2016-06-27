class JobsController < ApplicationController
  

  def index
  	@jobs = Job.all.order("created_at DESC")
  end

  def new
  	@job = Job.new
  end

  def show
  	@job = Job.find(params[:id])
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

  private 

  def set_job
  	@job = Job.find(params[:id])
  end

  def job_params
  	params.require(:job).permit(:position, :description, :company)
  end
end
