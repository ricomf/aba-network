class CommentsController < ApplicationController
  # GET /posts/:post_id/comments or /comments/:comment_id/comments
  def index
       post_comments = policy_scope(Comment).where(commentable_type: 'Post').order(created_at: :desc)
       comment_replies = policy_scope(Comment).where(commentable_type: 'Comment').order(created_at: :desc)
       
       render json: {
         post_comments: post_comments.map { |comment| CommentSerializer.call(comment) },
         comment_replies: comment_replies.map { |comment| CommentSerializer.call(comment) }
       }
  end

  # GET /posts/:post_id/comments/:id or /comments/:comment_id/comments/:id
  def show
    authorize comment
    render json: CommentSerializer.call(comment)
  end

  #POST /posts/:post_id/comments or /comments/:comment_id/comments
  def create
    comment = commentable.comments.create(permitted_attributes(Comment).merge(user: current_user)) 
    authorize comment
    render json: CommentSerializer.call(comment), status: :created
  end

  # PATCH /posts/:post_id/comments/:id or /comments/:comment_id/comments/:id
  def update
    authorize comment
    comment.update!(permitted_attributes(Comment))
    render json: CommentSerializer.call(comment), status: :ok
  end

  private

  def commentable
    @commentable ||= if params[:post_id]
                       Post.find_by(id: params[:post_id])
                     elsif params[:comment_id]
                       Comment.find_by(id: params[:comment_id])
                     else 
                        raise ActionController::ParameterMissing, 'Commentable not found.'
                     end
  end

  def comment
    @comment ||= commentable.comments.find_by(id: params[:id])
  end
end
