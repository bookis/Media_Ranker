class WelcomeController < ApplicationController
  def index
    @books = Book.all
    @top_books = @books.sort_by{|x| x[:rank]}.reverse.take(3)
    @albums = Album.all
    @top_albums = @albums.sort_by{|x| x[:rank]}.reverse.take(3)
    @movies = Movie.all
    @top_movies = @movies.sort_by{|x| x[:rank]}.reverse.take(3)
    # Could I make this into a helper method? Something to do this in a more DRY manner?
  end
end