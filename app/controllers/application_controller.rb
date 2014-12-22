class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :skip_cors

  respond_to :html, :json

  def error(group, message)
  	{:message => errors[group][message], group: group}
  end

  private
  def errors
  	{
  		:format => {
  			:resource_not_found => "Could not find the specified format"
  		}
  	}
  end

  def skip_cors
headers['Access-Control-Allow-Origin'] = '*'
headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
headers['Access-Control-Request-Method'] = '*'
headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end


end
