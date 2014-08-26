class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])
    render nothing: true, status: :created
  end



end
