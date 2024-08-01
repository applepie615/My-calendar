class TweetsController < ApplicationController

protect_from_forgery

    before_action :authenticate_user! # 追加

    def index
        @tweet = Tweet.all
        @jobsearch = Tweet.where(category:"jobsearch")
        @study = Tweet.where(category:"study")
        @university = Tweet.where(category:"university")
        @other = Tweet.where(category:"other")
        start_date = params.fetch(:start_date, Date.today).to_date
        @events = Tweet.where('start_time <= ? AND (end_time >= ? OR end_time IS NULL)', start_date.end_of_month.end_of_week, start_date.beginning_of_month.beginning_of_week)
    end

    def new
        @tweet = Tweet.new
        @category = params[:category]
        @events = Tweet.new
    end
    
    def create
        tweet = Tweet.new(tweet_params)
        if tweet.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @tweet = Tweet.find(params[:id])
        @events = Tweet.find(params[:id])
        @comments = @tweet.comments
        @comment = Comment.new
    end

    def edit
        @tweet = Tweet.find(params[:id])
        @events = Tweet.find(params[:id])
    end

    def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
            redirect_to :action => "show", :id => tweet.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
    end

    def week
        @tweet = Tweet.all
        @jobsearch = Tweet.where(category:"jobsearch")
        @study = Tweet.where(category:"study")
        @university = Tweet.where(category:"university")
        @other = Tweet.where(category:"other")
        start_date = params.fetch(:start_date, Date.today).to_date
        @events = Tweet.where('start_time <= ? AND (end_time >= ? OR end_time IS NULL)', start_date.end_of_month.end_of_week, start_date.beginning_of_month.beginning_of_week)
    end
    
    private
    def tweet_params
        params.require(:tweet).permit(:thing, :date_date, :date_time, :address, :title, :content, :start_time, :end_time, :category, :cretaed_at, :updated_at)
    end
end