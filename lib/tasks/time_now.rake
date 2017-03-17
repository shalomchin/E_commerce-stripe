namespace :time_utils do
desc "This should show current Time"
task :show_time => :environment do 
 puts "Current time is #{Time.now}"
end
end
