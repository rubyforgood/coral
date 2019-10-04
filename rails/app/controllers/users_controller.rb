class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.kept
  end

  def show
  end
end
