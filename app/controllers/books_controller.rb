class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else
    @books = Book.all
    @book1 = Book.new
    render :index
    end
  end

  def index
    @books = Book.all
    @book1 = Book.new
    @book = Book.new
  end

  def show
    @book1 = Book.find(params[:id])
  end

  def edit
    @book1 = Book.find(params[:id])
    @book = Book.new
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id),notice: 'Book was successfully created.'
    else
    @book1 = Book.find(params[:id])
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books', alert: "Book was successfully destroyed."
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
