class BorrowsController < ApplicationController
  before_action :set_book
  before_action :set_book_borrow, only: [:show, :update, :destroy]

  # GET /books/:book_id/borrows
  def index
    json_response(@book.borrows)
  end

  # GET /books/:book_id/borrows/:id
  def show
    json_response(@borrow)
  end

  # POST /books/:book_id/borrows
  def create
    @book.borrows.create!(borrow_params)
    json_response(@book, :created)
  end

  # PUT /books/:book_id/borrows/:id
  def update
    @borrow.update(borrow_params)
    head :no_content
  end

  # DELETE /books/:book_id/borrows/:id
  def destroy
    @borrow.destroy
    head :no_content
  end

  private

  def borrow_params
    params.permit(:name, :returned)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_book_borrow
    @borrow = @book.borrows.find_by!(id: params[:id]) if @book
  end
end
