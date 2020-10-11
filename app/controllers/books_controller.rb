class BooksController < ApplicationController

  def index
  	@books = BookReview.all
    @new_book = new
  end

  def show
    @book = BookReview.find(params[:id])
  end

  def create
    book_review = BookReview.new(book_params)
    book_review.save
    redirect_to show_books_path(book_review.id), notice: "Book was successfully created."
  end

  def edit
    @book = BookReview.find(params[:id])
  end

  def update
    book = BookReview.find(params[:id])
    book.update(book_params)
    @is_updated = true
    redirect_to show_books_path(book.id), notice: "Book was successfully updated."
  end

  def destroy
    book = BookReview.find(params[:id])
    book.destroy
    @is_destroyed = true
    redirect_to index_books_path, notice: "Book was successfully destroyed."
  end

  private
  def new
    BookReview.new
  end

  def book_params
    params.require(:book_review).permit(:title, :body)
  end
end
