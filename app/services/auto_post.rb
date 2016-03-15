class AutoPost
  @graph = Koala::Facebook::API.new(ENV['ACCESS_TOKEN'])
  @twitter = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
  end

  class << self

    def publish(item)
      content = "#{item.title} #{item.link}"
      @graph.put_connections("me", "feed", message: content)
      @twitter.update(content)
    end

    def publish_updates
      range = Time.now - 6.hours
      items = Medium.where('created_at > ?', range).all
      items.each{ |item| publish(item) }
    end
  end
end
