
class UsersController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    if (user = User.create(user_params))
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def show
    if User.find_by(id: params[:id]) && session[:user_id]
      @user = User.find_by(id: params[:id])
      render :show
    else
      redirect_to '/'
    end
  end

  def destroy
    session.delete :name
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

end