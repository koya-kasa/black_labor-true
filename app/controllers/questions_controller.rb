class QuestionsController < ApplicationController
  skip_before_action :login_required
  before_action :require_admin, only: [:index]
  
  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page]).order(created_at: :desc)
  end
  
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    
    if @question.save
      redirect_to new_question_path, notice: "質問を送信しました。"
    else
      render :new
    end
  end
  
  private
  
  def question_params
    params.require(:question).permit(:email, :body, :faq_id)
  end
  
  def require_admin
    redirect_to new_question_path, notice: '権限がありません' unless current_user && current_user.admin?
  end
end
