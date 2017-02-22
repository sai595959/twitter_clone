module TweetsHelper
    
    def choose_new_or_edit_or_index
        if action_name == 'new' || action_name == 'confirm' || action_name == 'index'
            confirm_tweets_path

        elsif action_name == 'edit'
            tweet_path
        end
    end
end
