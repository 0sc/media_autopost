ACCESS_TOKEN = 'CAACEdEose0cBAGWtedQJTDnVLWrxeCc9OpHrLb0ra4sbiiLQueqVCGuCXeAkHd5zkfZC6MU5Sy6CKEpCUIvUnv7fOmma3ZBpcCRUdqhJgvffQ2tJbZCObuX74NEHZBW7Q1y8Ex6SEive5EJ0SElqM2SrbgVhaXFQmfZCZBaL519CZB9wirZCNoYYVu8ppjHi48uczKqNZByjr3gZDZD'

class AutoPost
  class << self

    def publish(item)
      @graph = Koala::Facebook::API.new(ACCESS_TOKEN)

      profile = @graph.get_object("me")
      @graph.put_connections("me", "feed", message: "#{item.title} #{item.link}")
    end

  end
end
