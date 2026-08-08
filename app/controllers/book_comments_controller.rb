class BookCommentsController < ApplicationController
  def create
    @book_comment = Current.user.book_comments.build(book_id: params[:book_id], body: params[:body])
    @book_comment.save
  end

  def destroy
    @book_comment = Current.user.book_comments.find(params[:id])
    @book_comment.destroy
  end

end
