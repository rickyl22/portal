class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    
    

    
    	
    
    if @resume.save
    	p "holaaaaa"
    	p @resume
      redirect_to :back
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to :back
  end

private
  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end
