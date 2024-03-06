class LibrariesController < ApplicationController
  before_action :set_library, only: [:destroy]

  def new
  end

  def create
  end

  def show
    @library = current_user.library
  end

  def edit
  end

  def update

  end

  def destroy
    @library.destroy
    redirect_to libraries_path(), status: :see_other
  end

  private

  def set_library
    @library = Library.find(params[:id])
  end

  def library_params
  end
end
