class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @book.save
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿がsuccessfullyしました"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      #renderはアクションを呼び出さずにviewファイルを呼び出す
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "更新がsuccessfullyしました"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "破壊がsuccessfullyしました"
    redirect_to book
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
