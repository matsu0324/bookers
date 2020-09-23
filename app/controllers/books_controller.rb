class BooksController < ApplicationController
  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end
  def create
    book = Book.new(book_params)
    if book.save
       redirect_to book_path(book.id), notice: 'Your book was successfully created'
    else
       @book = Book.new
       @books = Book.all
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
    if book.update(book_params)
    redirect_to book_path(book.id), notice: 'Your book was successfully updated'
    else
      render :index
    end
  end
  def destroy
    book = Book.find(params[:id])
    if book.destroy
    redirect_to books_path, notice: 'Your book was successfully destroyed'
    else
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
