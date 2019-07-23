class WorkExperiencesController < ApplicationController
  #途中
  skip_before_action :login_required, only: [:index, :show]
  
  def index
    @work_experiences = WorkExperience.all
  end

  def show
    @work_experience = WorkExperience.find(params[:id])
  end

  def new
    @work_experience = WorkExperience.new
  end
  
  def create
    @work_experience = current_user.work_experiences.new(we_params)
    
    if @work_experience.save
      redirect_to @work_experience, notice: "記事「#{@work_experience.title}」を投稿しました。"
    else
      render :new
    end
  end

  def edit
  end
  
  private
  
  def we_params
    params.require(:work_experience).permit(:title, :body)
  end
end
