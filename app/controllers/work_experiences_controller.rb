class WorkExperiencesController < ApplicationController
  skip_before_action :login_required, only: [:index, :show]
  before_action :set_work_experience, only: [:edit, :update]
  
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
  
  def update
    if @work_experience.update(we_params)
      redirect_to work_experience_path, notice: "記事「#{@work_experience.title}」を更新しました。"
    else
      render :edit
    end
  end
  
  private
  
  def we_params
    params.require(:work_experience).permit(:title, :body)
  end

  def set_work_experience
    @work_experience = current_user.work_experiences.find(params[:id])
  end
end