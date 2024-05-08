class TweetsController < ApplicationController
before_action :require_user_logged_in!
before_action :set_tweet, only: [:edit, :update, :show ]

def index
@tweets = Current.user.tweets
end


def new
    @tweet = Tweet.new
end


def edit
end

def update
    if @tweet.update(tweet_params)    
      redirect_to tweets_path, notice: "Tweet was updated successfully"
    else
      render :edit, status: 422
    end
end


def show
    @tweet.destroy
    redirect_to tweets_path, notice: "Tweet was unscheduled"
end

def create
    @tweet = Current.user.tweets.new(tweet_params)
    if @tweet.save
        redirect_to tweets_path, notice: "Tweet was scheduled successfully"
    else 
        render :new , status: 422

    end
end

private

def tweet_params
    params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
end

def set_tweet
    @tweet = Current.user.tweets.find(params[:id])
  end

end
