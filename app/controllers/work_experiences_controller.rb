class WorkExperiencesController < ApplicationController
  skip_before_action :login_required, only: [:index, :show, :tag_index]
  before_action :set_work_experience, only: [:edit, :update, :destroy]
  before_action :forbid_work_experience_user, only: [:edit, :update, :destroy]
  
  def index
    if params[:q].present?
      params[:q]['title_or_tags_name_or_user_name_cont_any'] = params[:q]['title_or_tags_name_or_user_name_cont_any'].split(/[\p{blank}\s]+/)
      set_ransack_work_experience
    else
      set_ransack_work_experience
    end
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
  
  def destroy
    @work_experience.destroy
    redirect_to user_path(@current_user), notice: "記事「#{@work_experience.title}」を削除しました。"
  end
  
  def tag_index
    @q = WorkExperience.ransack(params[:q])
    @work_experiences = WorkExperience.tagged_with("#{params[:tag_name]}").page(params[:page])
  end
  
  private
  
  def we_params
    params.require(:work_experience).permit(:title, :body, :tag_list)
  end

  def set_work_experience
    @work_experience = current_user.work_experiences.find(params[:id])
  end
  
  def set_ransack_work_experience
    @q = WorkExperience.ransack(params[:q])
    @work_experiences = @q.result(distinct: true).includes(:user).page(params[:page])
  end
  
  def forbid_work_experience_user
    redirect_to user_url(@current_user), notice: '権限がありません' unless @current_user.id == @work_experience.user_id
  end
end
