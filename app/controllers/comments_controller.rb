class CommentsController < ApplicationController
  include Pundit::Authorization
  before_action :authenticate_user!
  before_action :comment, only: %i[show]

  def index
    @comments = Comment.all.order(created_at: :desc)
    authorize @comments
    render json: @comments
  end

  def show
    authorize comment
    render json: comment
  end


  private
  def comment
    @comment ||= Comment.find(params[:id])
  end
end
