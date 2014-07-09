class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to root_url, :notice => user.email
      logged = true
  	else
  		flash.now.alert = "Invalid email and/or password"
  		render "new"
      logged = false
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
