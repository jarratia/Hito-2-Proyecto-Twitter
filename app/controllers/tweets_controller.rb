class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy, :retweets]

  # GET /tweets
  # GET /tweets.json
 
  

  def index
    @tweets = Tweet.all.page(params[:page]).per(25).order(created_at: :desc)
  end

  def search
    if params.has_key?(:content)
    @tweets = Tweet.content(params[:content])
    else
      @tweets = Tweet.all
    end
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @tweet = tag.tweets
  end

  def date
    @tweets = Tweet.where("updated_at <= ? AND updated_at >= ?", params[:date1], params[:date2])

    render json:@tweets.all
  end  
  

  # GET /tweets/new
  def new
    @tweet = current_user.tweets.build
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets 
  # POST /tweets.json
  def create
    @tweet = current_user.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def retweets
    retweet = Tweet.create(content: @tweet.content, user_id: @tweet.user_id, retweets: @tweet.id)
     if retweet.save
      redirect_to root_path, notice: 'Your Retweet was successfully published.'
     end
  end

  def profile_picture
    @tweet = current_user.profile_picture
  end
  

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, :likes, :retweets, :user_id, :tweets_tag)
    end
end
