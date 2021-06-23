class UsersController < ApplicationController
   before_action :authenticate_user!, except: [:log_in]

  def index
    @user = User.find(current_user.id)
    @book_new = Book.new
    @users = User.all#Userモデルの全部を表示
  end


  def show
    @book_new = Book.new
    #@mybook = Book.where(user_id: params[:id])
    @user = User.find(params[:id])
    @mybook = @user.books
  end

  def create
    @user = current_user
    @book_new = Book.new(book_params)
    if @book_new.save
      redirect_to users_path
    else
      render :show
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update (user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
