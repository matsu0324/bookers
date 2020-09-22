class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
  end
  def new
    @book = Book.new
  end
  def create
    book = Book.new(book_params)
    if book.save
       redirect_to book_path(book.id), notice: 'Your book was successfully created'
    else
      flash.now[:alert] = 'no'
      render :index
    end
  end
  def show
    @book = Book.find(params[:id])
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end
