class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
    @user = @book.user
    @book_comment = Book.new
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.find(params[:id])
    @book_comment.destroy!
    #BookComment.find_by(id: params[:id]).destroy
  end

   private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
