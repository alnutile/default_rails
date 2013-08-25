class ProfilesController < ApplicationController
  before_filter :profile_check?

  def index
    @users = User.order("id")
  end

  def edit
    @user =  User.find_by_id(params[:id])
  end

  def update
    @user = User.new
    @user = User.find_by_id(params[:id])

    if @user.update_attributes(params[:profile])
      flash[:success] = "The profile was updated."
      redirect_to "/profiles"
    else
      flash.now[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def new
    @user = User.new
  end

  def create
    logger.info("Profile: #{params}")
    @user = User.new(params[:profile])

    if @user.save
      redirect_to '/profiles', :notice => "User Created #{ActionController::Base.helpers.link_to @user.email, "/profiles/#{@user.id}/edit"}".html_safe
      return
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to profiles_path
  end

  def profile_check?
    redirect_to new_user_session_path, :flash => ({ :error => 'You need to sign in to see this page.'}) unless current_user.present?
  end

end
