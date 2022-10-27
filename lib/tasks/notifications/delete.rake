namespace :notifications do

    task :delete_older => :environment do
        desc 'Deleting notifications older than 1 week...'

        Notification.where(deleted_at: nil).where("created_at <= ?", (DateTime.now - 1.week)).update_all(deleted_at: DateTime.now)

        puts "Notifications deleted."

    end    

end
