class BooksController < ApplicationController

  def index
    @book = Book.new#Bookモデルに新しいものを作成。箱の段階
  end

  def create
  end

  def show
    @book = Book.new
  end

  def delete
  end

end
