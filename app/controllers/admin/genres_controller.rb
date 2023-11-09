class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def index
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def show
    @genre = Genre.find(params[:id])
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      redirect_to new_admin_genre_path
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genre_path(@genre.id)
    else
      redirect_to edit_admin_genre_path(@genre.id)
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
