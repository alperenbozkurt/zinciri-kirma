class CommentsController < ApplicationController
  before_action :comment_owner, only: [:destroy]
  def create
    @comment = Comment.new(strong_params)
    @comment.chain_id = params[:chain_id]
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = 'Yorum Yapıldı.'
      redirect_to chain_path(params[:chain_id])
    else
      flash[:notice] = 'Yanlış gitti...'
      render 'home/index'
    end
  end
  def destroy
    @comment.destroy
    flash[:notice] = 'Yorum Başarıyla Silindi'
    redirect_to root_path
  end
  def comment_owner
    @comment = Comment.find(params[:id])
    unless current_user.id == @comment.user_id
      flash[:error] = 'Erişim Yetkin yok.'
      redirect_to root_path
     end
  end
  private
  def strong_params
    params.require(:comment).permit(:content,:chain_id)
  end
end
