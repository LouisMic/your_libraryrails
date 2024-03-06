class ReadingsController < ApplicationController
  def new
  end

  def create
    @book = params[:book_id] ? Book.find(params[:book_id]) : Book.find_or_create_by(title: "tbd", author: "tbd")
    @reading = Reading.new(user: current_user, reading_status: 1, book: @book)
    if @reading.save
      redirect_to reading_path(@reading)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def index
    @my_readings = Reading.my_books(current_user)
  end

  def show
    @reading = Reading.find(params[:id])
    @playlist_item = PlaylistItem.new()
    @playlists = Playlist.all
  end
end
