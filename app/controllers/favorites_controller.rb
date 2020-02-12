class FavoritesController < ApplicationController
before_action :require_user_logged_in
  def create
    micropost = Micropost.find(params[:micropost_id])#どの投稿かは_favoriteで特定されてる、userの場合は@userで定義されてるけどこれはmicropostで定義
    current_user.like(micropost)
    flash[:success] = '投稿をお気に入りしました。'
    redirect_to root_path
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_path
  end
end
