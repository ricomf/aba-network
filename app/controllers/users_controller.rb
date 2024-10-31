class UsersController < ApplicationController
  def index
    authorize User
    @users = policy_scope(User).order(created_at: :desc)
    
    render json: @users.map { |user| UserSerializer.call(user) }
  end

  def show
    authorize user

    render json: UserSerializer.call(user)
  end

  def create
    authorize User
    
    begin
      @user = User.create!(permitted_attributes(User))
      render json: UserSerializer.call(@user), status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors }, status: :unprocessable_entity
    end
  end
  

  def update
    authorize user
    user.update!(permitted_attributes(User))

    render json: UserSerializer.call(user), status: :ok
  end
  
  private

  def user
    @user ||= User.find(params[:id])
  end
end
