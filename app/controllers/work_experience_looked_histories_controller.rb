class WorkExperienceLookedHistoriesController < ApplicationController
    before_action :forbid_history_destroy_user, only: [:destroy]
    
    def destroy
        set_history
        @history.destroy
        redirect_to user_path(@current_user), notice: "記事「#{@history.work_experience.title}」を閲覧履歴から削除しました。"
    end
    
    private
    
    def set_history
        @history = current_user.work_experience_looked_histories.find_by(work_experience_id: params[:work_experience_id])
    end
    
    def forbid_history_destroy_user
        set_history
        redirect_to user_url(@current_user), notice: '権限がありません' unless @current_user.id == @history.user_id
    end
end
