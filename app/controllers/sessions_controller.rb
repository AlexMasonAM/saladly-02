class SessionsController < ApplicationController

  def new
  end

  def create # the act of logging in
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password]) #user exists and has been authenticated
      flash[:info] = "You logged in succesfully!"
      session[:user_id] = user.id
      redirect_to ingredients_path
    else
      flash.now[:danger] = "You failed (at logging in...not life)!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end













