class BooksController < ApplicationController

  def index
    @book_new = Book.new#Bookモデルに新しいものを作成。箱の段階
    @books = Book.all
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.save
    if @book.save
      redirect_to user_path
    else
      render :index
    end
  end

  def show
    @book = Book.new
    @book_show = Book.find(params[:id])
  end

  def delete
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
