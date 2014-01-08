class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    @top_albums = @albums.sort_by{|x| x[:rank]}.reverse
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to "/albums", notice: "Good Job! You created a album!"
    else
      redirect_to '/albums', notice: "There was an error, try again."
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy!
    redirect_to '/albums', notice: "You've deleted a album! It's gone forever."
  end

  def show
    @album = Album.find(params[:id])
  end

  def upvote
    @album = Album.find(params[:id])
    @rank = @album.rank
    @album.rank = @album.rank + 1
    if @album.save!
      redirect_to '/albums', notice: "Your opinion totally matters."
    else 
      redirect_to '/albums', notice: "There was a problem. Sorry."
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_path, notice: "You've successfully updated #{@album.title}!"
    else
      render :edit
    end
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :artist, :description)
  end
end