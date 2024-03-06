class PlaylistsController < ApplicationController
  def create
  end

  def index
    @playlists = Playlist.all
  end

  def show
  end

  def update
  end

  def destroy
  end
end
