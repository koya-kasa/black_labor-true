class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :confirm_new, :create]
  before_action :require_admin, only: [:destroy, :index]
  before_action :already_login, only: [:new, :confirm_new, :create]
  before_action :forbid_user, only: [:edit, :update]
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @work_experiences = @user.work_experiences.page(params[:page]).per(5).updated_at_paging
    @likes = @user.likes.page(params[:page]).per(5).created_at_paging
    @histories = @user.work_experience_looked_histories.page(params[:page]).per(5).order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    return render :new if params[:back].present?

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_url(@user), notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    return render :show if params[:back].present?

    if @user.update(user_params)
      redirect_to @user, notice: "ユーザー「#{@user.name}」の情報を更新しました。"
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "ユーザー「#{@user.name}」の情報を削除しました。"
  end

  def confirm_new
    @user = User.new(user_params)
    render :new unless @user.valid?
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :password, :password_confirmation, :admin)
  end
  
  def require_admin
    redirect_to user_url(@current_user), notice: '権限がありません' unless current_user.admin?
  end
  
  def forbid_user
    redirect_to user_url(@current_user), notice: '権限がありません' unless @current_user.id == params[:id].to_i
  end
end
