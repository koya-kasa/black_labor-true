class WorkExperiencesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @work_experience = WorkExperience.new
  end
  
  def create
    @work_experience = WorkExperience.new(we_params)
    
    if @work_experience.save
      redirect_to work_experience_path, notice: "記事「#{@work_experience.title}」を投稿しました。"
    else
      render :new
    end
  end

  def edit
  end
  
  private
  
  def we_params
    params.require(:work_experience).permit(:title, :body, :user_id)
  end
end
