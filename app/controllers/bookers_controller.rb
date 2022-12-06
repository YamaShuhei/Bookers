class BookersController < ApplicationController
  def new
  end

  def create
    @booker = Book.new(book_params)
    if @booker.save
      redirect_to booker_path(@booker.id)
      flash[:notice] = "投稿が成功しました"
    else
      flash[:notice] = "投稿に失敗しました、もう一度お試しください。"
      @bookers = Book.all
      render :index
    end
  end

  def index
    @bookers = Book.all
    @booker = Book.new
    @formtitle = "ここにタイトルを記入してください。"
    @formbody = "ここに感想文を記入してください。"
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
      redirect_to booker_path(@booker.id)
      flash[:notice] = "更新しました。"
    else
      flash[:notice] = "更新に失敗しました、もう一度お試しください。"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/bookers'
    flash[:notice] = "投稿を削除しました。"
  end

  private
  #ストロングパラメータ
  def book_params
    #paramsはbookから送られてくるデータ
    #requireは送られてきたデータの中からモデル名を指定
    #requireは絞りこんだデータの中から、カラムを指定
    params.require(:book).permit(:title, :body)
  end
end
