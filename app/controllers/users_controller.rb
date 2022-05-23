class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def create
  @user = User.new(user_params)
    if @user.save
       flash.now[:success] = 'Welcome! You have signed up successfully.'
      redirect_to current_path
    else
      render :new
    end
  end

  def destroy
　@user =User.session.delete(:user_id)

  flash[:alert] = 'Signed out successfully.'
  redirect_to :root
  end

  def update
       @user = User.find(params[:id])
    @user.update(user_params)
     if @user.save
      flash[:alert] = 'You have profile edit successfully'
      redirect_to user_path(@user.id)
     else
       render :edit
     end
  end

  def edit
     @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
