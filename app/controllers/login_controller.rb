class LoginController < ApplicationController
                                          
  before_filter :authorize, :except => :login
  
  def login
    session[:user_id] = nil
    if request.post?
      user = Usuario.authenticate(params[:nome], params[:senha])
      if user
        session[:user_id] = user # o mesmo que user.id
        redirect_to(:controller => "notas", :action => "index")
      else
        flash[:notice] = "Dados inválidos"
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to(:action => "login")
  end
  
end
