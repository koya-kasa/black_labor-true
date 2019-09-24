class LikesController < ApplicationController
    def create
        return redirect_to work_experiences_path, notice: 'その記事は既にお気に入り登録されています。' unless @current_user&.liked?(params[:work_experience_id])
        
        @like = current_user.likes.new(work_experience_id: params[:work_experience_id])
        
        if @like.save
            redirect_to user_path(@like.user), notice: "記事「#{@like.work_experience.title}」をお気に入りに追加しました。"
        else
            render 'users/show'
        end
    end
    
    def destroy
        @like = current_user.likes.find_by(work_experience_id: params[:work_experience_id])
        if @current_user.liked?(@like.work_experience.id)
            redirect_to @current_user, notice: "「#{@like.work_experience.title}」はお気に入り登録されていません。"
        else
            @like.destroy
            redirect_to @current_user, notice: "お気に入り「#{@like.work_experience.title}」を削除しました。"
        end
    end
end
