class WorkExperienceCommentsController < ApplicationController
  def create
    @work_experience = WorkExperience.find(params[:work_experience_id])
    @work_experience_comments = @work_experience.work_experience_comments
    @work_experience_comment = current_user.work_experience_comments.new(wec_params)
    
    if @work_experience_comment.save
      redirect_to work_experience_path(@work_experience), notice: "感想を投稿しました。"
    else
      render 'work_experiences/show'
    end
  end
  
  private
  
  def wec_params
    params.require(:work_experience_comment).permit(:body).merge(work_experience_id: @work_experience.id)
  end
end
