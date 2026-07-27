class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :ensure_correct_user, only: %i[edit update destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @new_book = Current.user.books.build(book_params)
    if @new_book.save
      redirect_to book_path(@new_book), notice: "Book was successfully created"
    else
      @books = Book.all
      render "books/index", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Book was successfully deleted"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def ensure_correct_user
    unless @book.user == Current.user
      redirect_to books_path, alert: "error: You are not authorized to perform this action"
    end
  end
end