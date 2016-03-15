ACCESS_TOKEN = 'CAACEdEose0cBACZCdzTGKps1XMop5Dapv7ZCeOcP2kCr9PInadlAB6wNzZB4RcA6eQJesZAdumdEZCIcKg4gMUYAlZBTfQj2fsQ1GhLbKN1WJN5DZCKP2TdBAme46UvVzZAKCkgO0S48qFHLMnoLZAy9EQY4NCI1QjTgAY3eC1c5LmFaZB0AnA7DJFSJOroH8HB0IPZC0xOCrAkDwZDZD'

class AutoPost
  @graph = Koala::Facebook::API.new(ACCESS_TOKEN)
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
