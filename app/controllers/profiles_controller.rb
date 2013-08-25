class ProfilesController < ApplicationController
  before_filter :profile_check?

  def index
    @users = User.all
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
    # role = [];
    # @todo come back and make this so I can just pass the params
    @user = User.new

    if check_email(params[:profile][:email]) == true
      flash[:error] = "Email Already in System"
      render :action => "new"
      return
    end

    if @user.save
      redirect_to '/profiles', :notice => "User Created #{ActionController::Base.helpers.link_to @user.email, "/profiles/#{@user.id}/edit"} the api response #{response.inspect}".html_safe
      return
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end

  end

  def profile_check?
    redirect_to new_user_session_path, :flash => ({ :error => 'You need to sign in to see this page.'}) unless current_user.present?
  end

  def check_email(email)
    return true unless User.find_by_email(email).nil?
  end

end
