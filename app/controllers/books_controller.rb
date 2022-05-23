class BooksController < ApplicationController
  before_action :authenticate_user!,except: [:top]

def index
    @user = current_user
    @books = Book.all
    @book = Book.new
end

  def new
 @book = Book.new
  end

  def create
    @book = Book.new(book_params)
     @book.user_id = current_user.id
     if @book.save
       flash[:notice] ='You have created book successfully'
       redirect_to book_path(@book.id)
     else
      @user = current_user
      @books = Book.all
       render :index
     end
  end

  def show
      @book_new = Book.new
      @book = Book.find(params[:id])
      @user = @book.user
  end

  def destroy
        @book = Book.find(params[:id])
        @book.destroy
    redirect_to books_path
  end

  def update
    @book =  Book.find(params[:id])
    @book.user_id = current_user.id
     if @book.update(book_params)
           flash[:notice] =  'You have updated book successfully.'
            redirect_to  book_path(@book.id)
     else
       render :edit
     end
  end

  def edit
     @book = current_user.books.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title,  :body)
  end

end
