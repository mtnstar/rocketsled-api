class ApiKeysController < ApplicationController

  skip_before_filter :check_authorization, only: [:create]

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      api_key = ApiKey.find_or_create_by!(user: user)
      render_json(api_key)
    else
      add_error('invalid user or password')
      @response_status = :unauthorized
      render_json
    end
  end

  def destroy
  end
end
