class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @books = @user.books.reverse_order
     @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

    def update
    @user = User.find(params[:id])
     if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "Profile was successfully updated."

     else
      render :edit
     end
    end

  def create
    if @user.save
       flash[:notice]
      redirect_to user_path(@user.id)

    else
      @user = User.all
      render :index
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
