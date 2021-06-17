class UsersController < ApplicationController
  
  def index
    @users = User.all#Userモデルの全部を表示
    
  end
  
  
  def show
    @user = User.find(current_user.id)
    @book_new = Book.new
    @mybook = Book.where(user_id: params[:id])
    
  end
  
  def create
    book_new = Book.new(book_params)
    book_new.save
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update (user_params)
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title, :opinion, :user_id)
  end
end
