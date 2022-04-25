class UsersController < ApplicationController
  before_action :set_params,only: %i[show edit ]
  def index
  end

  def new
    @user=User.new
  end
  
  def create
    @user=User.new filter_params
    if @user.valid?
      if @user.save
        flash[:win]='You signed up successfully'
        redirect_to @user
      end
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def filter_params
    params.require(:user).permit(:name,:username,:gender,:email,  :city,:state,:address,:phone,:pincode,:password,:password_confirmation)
  end

  def set_params
    @user=User.find params[:id]
  end
end