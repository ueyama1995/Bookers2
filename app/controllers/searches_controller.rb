class SearchesController < ApplicationController
  def search
     @range = params[:range]
     search = params[:search]
     word = params[:word]
    if @range == '1'
    @user = User.search(search,word)
    #binding.pry
    else
    @book = Book.search(search,word)
    end
  end
end