class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: %i[new create]

  def new
  end

  def create
    account = Account.create_with(auth).find_or_create_by(public_id: auth['public_id'])

    if account
      session[:account_id] = account.id
      redirect_to tasks_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:account_id] = nil
    @current_account = nil

    redirect_to login_path
  end

  private

  def auth
    @auth ||= request.env['omniauth.auth']['info'].to_h.slice('public_id', 'role', 'full_name')
  end
end
