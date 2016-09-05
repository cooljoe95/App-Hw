class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
  end

  def new
    # your code here
    # book = Book.new(book_params)
    # book.save
  end

  def create
    # your code here
    book = Book.new(book_params)
    book.save
    redirect_to "http://localhost:3000/books"
  end

  def destroy
    # your code here
    Book.delete(params["id"].to_i)
    redirect_to "http://localhost:3000/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
