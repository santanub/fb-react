class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments.to_json(only: [:id, :comment, :author, :like_count])
  end

  def create
    comment = Comment.create(author: params[:author], comment: params[:comment])
    render json: comment.to_json(only: [:id, :comment, :author, :like_count])
  end

  def like
    comment = Comment.find(params[:id])
    comment.like_count = comment.like_count + 1

    if comment.save
      render json: comment.to_json(only: [:id, :comment, :author, :like_count])
    end
  end
end
