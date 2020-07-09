env :PATH, ENV['PATH']
set :output, "log/cron.log"
set :environment, :development

# batch test
every 1.minute do
  command "echo 'test'"
end

# 混雑度1時間おきに削除
every 1.hour do
  runner "Congestion.delete_test"
end
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
