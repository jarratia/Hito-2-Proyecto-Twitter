class LikesController < ApplicationController
    #before_action :find_tweet

  def index
    @likes = Like.all(params[:tweet_id])
  end 

  def create
    @tweet = Tweet.find(params[:tweet_id])

    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @tweet.likes.create(user_id: current_user.id)
    end

    redirect_to tweets_path
  end

  def already_liked?
    Like.where(user_id: current_user.id, tweet_id: params[:tweet_id]).exists?
  end

  private

  def find_post
    @tweet = Tweet.find(params[:tweet_id])
  end
end
