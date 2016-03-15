desc "Publish updates to media every 6hrs"
task :publish_updates => :environment do
  AutoPost.publish_updates
end
