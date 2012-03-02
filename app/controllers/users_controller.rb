class UsersController < ApplicationController
  
  skip_before_filter :login_user!, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def edit
    @user = current_user
  end
  
  def index
    @users = User.all
    
    @user = current_user
    
    @academy = User.where(:location => "Academy")
    @cloud = User.where(:location => "Cloud")    
  end
  
  def create
    # @user = User.new(params[:user])
    @user = User.find_or_create_by_name(params[:user])
      cookies.permanent[:user_id] = @user.id
      redirect_to root_url    
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_url
    else
      render 'edit'
    end
  end
  
end
