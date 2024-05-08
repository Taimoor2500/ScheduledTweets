class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account


  validates :body, length: {minimum: 1 , maximum: 280}
  validates :publish_at , presence: true


  after_initialize do 
    self.publish_at ||= 24.hours.from_now
  end

  def published? ####? return true and false
    tweet_id? #if empty not published
  end


 after_save_commit do
    if publish_at_previously_changed?
      TweetJob.set(wait_until: publish_at).perform_later(self)
    end
  end


  def publish_to_twitter!
    client = twitter_account.client
    tweet = client.post("tweets", "{\"text\": #{self.body.to_json}}")

    update(tweet_id: tweet["data"]["id"])
  end
  
 
  

  

  

  
end
