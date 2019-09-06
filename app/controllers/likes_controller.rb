class LikesController < ApplicationController
    def create
        return redirect_to work_experiences_path, notice: 'その記事は既にお気に入り登録されています。' if check_current_user_likes(params[:work_experience_id]).present?
        
        @like = current_user.likes.new(work_experience_id: params[:work_experience_id])
        
        if @like.save
            redirect_to user_path(@like.user), notice: "記事「#{@like.work_experience.title}」をお気に入りに追加しました。"
        else
            render 'users/show'
        end
    end
end
