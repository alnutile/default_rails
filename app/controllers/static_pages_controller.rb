class StaticPagesController < ApplicationController
  before_filter :dashboard_check?, :only => :dashboard

  def home
  end

  def dashboard
  end

  def dashboard_check?
    redirect_to new_user_session_path, :flash => ({ :error => 'You need to sign in to see this page.'}) unless current_user.present?
  end
end
