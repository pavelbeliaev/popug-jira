class ApplicationController < ActionController::Base
  before_action :authenticate!

  def current_account
    @current_account ||= Account.find_by(id: session[:account_id])
  end

  helper_method :current_account

  def authenticate!
    redirect_to login_path(origin: request.path.presence || nil) unless authenticated?
  end

  def authenticated?
    current_account.present?
  end

  def admin_or_manager?
    current_account.admin? || current_account.manager?
  end

  helper_method :admin_or_manager?
end
