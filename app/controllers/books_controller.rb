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
    if book_review.save
      redirect_to show_books_path(book_review.id), notice: "Book was successfully created."
    else
      redirect_to show_books_path(book_review.id), alert: "Book was failure to created."
    end
  end

  def edit
    @book = BookReview.find(params[:id])
  end

  def update
    book_review = BookReview.find(params[:id])
    if book_review.update(book_params)
      redirect_to show_books_path(book_review.id), notice: "Book was successfully updated."
    else
      redirect_to show_books_path(book_review.id), alert: "Book was failure to updated."
    end
  end

  def destroy
    book_review = BookReview.find(params[:id])
    if book_review.destroy
      redirect_to index_books_path, notice: "Book was successfully destroyed."
    else
      redirect_to index_books_path, alert: "Book was failure to destroyed."
    end
  end

  private
  def new
    BookReview.new
  end

  def book_params
    params.require(:book_review).permit(:title, :body)
  end
end