namespace :email do
desc "This should send an email of the top three ladies"
task :show_time => :environment do 
 puts "Current time is #{Time.now}"
end
end
