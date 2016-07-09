class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].blank?
  	 @jobs = Job.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @jobs = Job.where(category_id: @category_id).order("created_at DESC")
    end
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
  	params.require(:job).permit(:position, :description, :company, :city, :category_id)
  end
end
