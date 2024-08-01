class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
        @tweet = Tweet.all
        @jobsearch = Tweet.where(category:"jobsearch")
        @study = Tweet.where(category:"study")
        @university = Tweet.where(category:"university")
        @other = Tweet.where(category:"other")
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to action: :index
    end

    private

    def user_params
        params.require(:user).permit(:title, :body, :photo) #photoを追加
    end
end
