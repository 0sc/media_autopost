class AutoPost
  @graph = Koala::Facebook::API.new(ENV['ACCESS_TOKEN'])
  class << self

    def publish(item)
      profile = @graph.get_object("me")
      @graph.put_connections("me", "feed", message: "#{item.title} #{item.link}")
    end

    def publish_updates
      range = Time.now - 6.hours
      items = Medium.where('created_at > ?', range).all
      items.each{ |item| publish(item) }
    end
  end
end
