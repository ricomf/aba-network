class UsersController < ApplicationController
    def index
      authorize User
      @users = User.all
      render json: @users
    end
  
    def show
      authorize user
      render json: user
    end

    def create
      @user = User.create(permitted_attributes(User))
      if user.saveP
        render json: user, status: :created
      end
    end
  
    def update
      authorize user
      if user.update(permitted_attributes(User))  
        render json: @user, status: :ok
      end
    end
    
    private

    def user
      @user ||= User.find(params[:id])
    end
  end

  def show
    authorize @user  # Autoriza a exibição de um único usuário
    render json: @user
  end

  private
  
  # Usado para buscar o usuário antes das ações específicas
  def set_user
    @user ||= User.find(params[:id])
  end
end
