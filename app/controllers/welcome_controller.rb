class WelcomeController < ApplicationController
  def index
    @books = Book.all
    @top_books = @books.sort_by{|x| x[:rank]}.reverse.take(3)
    @albums = Album.all
    @top_albums = @albums.sort_by{|x| x[:rank]}.reverse.take(3)
    @movies = Movie.all
    @top_movies = @movies.sort_by{|x| x[:rank]}.reverse.take(3)
    # Could I make this into a helper method? Something to do this in a more DRY manner?
    
    # FEEDBACK: Using the ActiveRecord SQL queries would take away some of the length of these methods
    # Also each find could be on a single line, we can go over each of these things, but this
    # could look like
    # 
    # @top_books  = Book.order("rank desc").limit(3)
    # @top_albums = Album.order("rank desc").limit(3)
    # @top_movies = Movie.order("rank desc").limit(3)
    
    # You could move this logic into the model (although, it's not needed), there you could
    # create a method that does this same order and limit, but using a single method, like:
    
    # @top_books = Book.top(3)
    
    # At this point it's not exactly dry, but it's as close as we're going to get
  end
end