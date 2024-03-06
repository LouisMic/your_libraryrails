class PlaylistItemsController < ApplicationController
  def create
    @playlist_item = PlaylistItem.new(playlist_item_params)
    @playlist_item.reading = Reading.find(params[:reading_id])
    if @playlist_item.save
      redirect_to playlists_path()
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    reading = Reading.find_by(book_id: params[:id])
    @playlist_item = PlaylistItem.find_by(reading: reading, playlist_id: params[:playlist_id])
    @playlist_item.destroy
    redirect_to playlists_path(), status: :see_other
  end

  private

  def playlist_item_params
    params.require(:playlist_item).permit(:playlist_id, :reading_id)
  end
end
