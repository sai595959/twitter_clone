class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy] #アクションの前に実行するため
  
  def index
    @tweet = Tweet.new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
    Tweet.order("id")
    @tweets = Tweet.all
    
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice:"ツイートしました！"
    else
        render 'new'
    end
  end
  
  def edit
    set_tweet
  end
  
  def update
    set_tweet
    @tweet.update(tweets_params)
    redirect_to tweets_path, notice:"ツイートを編集しました！"
  end
  
  def destroy
    set_tweet
    @tweet.destroy
    redirect_to tweets_path, notice:"ツイートを削除しました！"
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

end
