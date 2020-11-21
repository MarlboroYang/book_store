class BooksController < ApplicationController
  before_action :find_book, only:[:edit, :update, :destroy, :vote]

  def index
    @books = Book.all
  end
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "新增成功"
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @book.update(book_params)
      redirect_to books_path, notice: "更新成功"
    else
      render :edit
    end
  end
  def destroy
    @book.destroy if @book
    redirect_to books_path, notice: "已經刪除"
  end
  def vote
    @book.vote_logs.create(ip_address: request.remote_ip) if @book
    @book.save
    redirect_to books_path, notice: "投票完成"
  end

  private
  def book_params
    params.require(:book).permit(:name, :price)
  end
  def find_book
    @book = Book.find_by(id: params[:id])
  end
end


