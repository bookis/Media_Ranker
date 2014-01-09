class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @top_movies = @movies.sort_by{|x| x[:rank]}.reverse # FEEDBACK: Using th method I describe in welcom_controller.rb, you could SQL this query
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to "/movies", notice: "Good Job! You created a movie!"
    else
      redirect_to '/movies', notice: "There was an error, try again."
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy!
    redirect_to '/movies', notice: "You've deleted a movie! It's gone forever."
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def upvote
    @movie = Movie.find(params[:id])
    @rank = @movie.rank
    @movie.rank = @movie.rank + 1
    if @movie.save!
      redirect_to '/movies', notice: "Your opinion totally matters."
    else 
      redirect_to '/movies', notice: "There was a problem. Sorry."
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path, notice: "You have successfully edited #{@movie.title}!"
    else
      render :edit
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :director, :description)
  end
end