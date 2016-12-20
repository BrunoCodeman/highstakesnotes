class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, prepend: true, if: ->{request.format.json?}
  skip_before_action :verify_authenticity_token, :only => :create
  include DeviseTokenAuth::Concerns::SetUserByToken
end
