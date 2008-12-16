# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'e5d65e5fd1c09520ae163b7dca317cce'
  
  private
  
  def authorize
    unless Usuario.find_by_id(session[:user_id])
      #flash[:notice] = "Autentica‹o necess‡ria" TODO: pq nao est‡ aceitando utf-8? Na view aparece como '?'
      redirect_to(:controller => "login", :action => "login")
    end
  end
  
end
