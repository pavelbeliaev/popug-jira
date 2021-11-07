class ApplicationController < ActionController::Base
  def current_account
    @current_account ||= Account.find_by(id: session[:account_id])
  end

  def authenticate!
    redirect_to login_path(origin: request.path.presence || nil) unless authenticated?
  end

  def authenticated?
    current_account.present?
  end
end
