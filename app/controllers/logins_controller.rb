class LoginsController < ApplicationController
  
  def create
    @login = Login.new(params[:login])
    if @login.save
      flash[:notice] = "Registration successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def edit
    @login = current_login
  end

  def update
    @login = current_login
    if @login.update_attributes(params[:login])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    # Remove the user id from the session
    session[:current_user_id] = nil
    redirect_to root_url
  end


end
