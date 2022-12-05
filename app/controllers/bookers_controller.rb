class BookersController < ApplicationController
  def new
  @booker= List.new
  @formtitle = "ここにタイトルを記入してください。"
  @formbody = "ここに感想文を記入してください。"
  end

  def create
    @booker = List.new(list_params)
    if @booker.save
      redirect_to booker_path(@booker.id)
    else
      render :new
    end
  end

  def index
    @bookers = List.all
  end

  def show
    @booker = List.find(params[:id])
  end

  def edit
    @booker= List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to booker_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/bookers'
  end

  private
  #ストロングパラメータ
  def list_params
    #paramsはformから送られてくるデータ
    #requireは送られてきたデータの中からモデル名を指定
    #requireは絞りこんだデータの中から、カラムを指定
    params.require(:list).permit(:title, :body)
  end
end
