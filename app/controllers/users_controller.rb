class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :following, :followers]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def index
    @users = User.page(params[:page])
  end

  def new
  	@user = User.new
  end

  def show 
  	@user = User.find(params[:id])
    if @user.admin? 
      @user_type = true
    else
      @user_type = false
    end  
    @microposts = @user.microposts.all 
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		#hander successful save
  		flash[:success] = "Wellcome to Resource App"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user]) 
      flash[:success] = "Update Successfully"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
	  @user.destroy
    flash[:success] = "User destroyed"
    redirect_to root_path
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def notify_friend
    @user = User.find(params[:id])
    Notifier.email_friend( params[:email]).deliver
   redirect_to users_path, :notice => "Successfully sent a message to your friend"
  end


  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end  
end
