class BooksController < ApplicationController
  def index
    @books = Book.all
    @top_books = @books.sort_by{|x| x[:rank]}.reverse
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to "/books", notice: "Good Job! You created a book!"
    else
      redirect_to '/books', notice: "There was an error, try again."
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy!
    redirect_to '/books', notice: "You've deleted a book! It's gone forever."
  end

  def show
    @book = Book.find(params[:id])
  end

  def upvote
    @book = Book.find(params[:id])
    @rank = @book.rank
    @book.rank = @book.rank + 1
    if @book.save!
      redirect_to '/books', notice: "Your opinion totally matters."
    else 
      redirect_to '/books', notice: "There was a problem. Sorry."
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path, notice: "You have successfully updated #{@book.title}!"
    else
      render :edit
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end