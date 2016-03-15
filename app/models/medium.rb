class Medium < ActiveRecord::Base
  after_save { AutoPost.publish(self) }
end
