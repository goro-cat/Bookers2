class BooksController < ApplicationController

  before_action :authenticate_user!,except: [:log_i]

  def index
    @user = current_user
    @book_new = Book.new#Bookモデルに新しいものを作成。箱の段階
    @books = Book.all

  end

  def create
    @user = current_user
    @books = Book.all
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id

    if @book_new.save
      redirect_to book_path(@book_new.id), notice: "You have created book successfully."
    else
      render :index
    end
  end

  def show
  #  @user = current_user
    @book_new = Book.new
    @book = Book.find(params[:id])
    @users = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "You have updated book successfully."
    else
      render :edit
    end
  end



  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)#opinionから
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
