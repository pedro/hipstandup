require 'rubygems'
require 'bundler'
require 'time'
Bundler.require

require './hipstandup'

desc "Invite people for a standup on HipChat"
task :run do
  if [0, 6].include?(Time.now.wday)
    puts "Skipping weekend"
  else
    token   = ENV["HIPCHAT_API_TOKEN"] || abort("missing HIPCHAT_API_TOKEN")
    setup   = ENV["SETUP"] || abort("missing SETUP")
    standup = Hipstandup.new(token)

    Hipstandup.parse_setup(setup).each do |room, people|
      standup.notify(room, people)
      puts "Notified #{room}"
    end
  end
end
