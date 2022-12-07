class BooksController < ApplicationController

  def create
    @booker = Book.new(book_params)
    if @booker.save
      redirect_to book_path(@booker.id)
      flash[:notice] = "Post successfully"
    else
      flash[:notice] = "Post error"
      @bookers = Book.all
      render :index
    end
  end

  def index
    @bookers = Book.all
    @booker = Book.new
    @formtitle = "Enter the title here."
    @formbody = "Please fill in your book report here."
  end

  def show
    @booker = Book.find(params[:id])
  end

  def edit
    @booker= Book.find(params[:id])
  end

  def update
    @booker = Book.find(params[:id])
    if @booker.update(book_params)
      redirect_to book_path(@booker.id)
      flash[:notice] = "Update successfully"
    else
      flash[:notice] = "Update error"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
    flash[:notice] = "Post destroy."
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
