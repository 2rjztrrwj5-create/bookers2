class SearchesController < ApplicationController
  def search
    if params[:target] == "user"
      if params[:method] == "perfect"
        @users = User.where(name: params[:keyword])
      elsif params[:method] == "forward"
        @users = User.where("name LIKE ?", "#{params[:keyword]}%")
      elsif params[:method] == "backward"
        @users = User.where("name LIKE ?", "%#{params[:keyword]}")
      else
        @users = User.where("name LIKE ?", "%#{params[:keyword]}%")
      end
    else
      if params[:method] == "perfect"
        @books = Book.where(title: params[:keyword])
      elsif params[:method] == "forward"
        @books = Book.where("title LIKE ?", "#{params[:keyword]}%")
      elsif params[:method] == "backward"
        @books = Book.where("title LIKE ?", "%#{params[:keyword]}")
      else
        @books = Book.where("title LIKE ?", "%#{params[:keyword]}%")
      end
    end
  end

end
