# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Americo::Application.load_tasks

Rake::Task["assets:precompile"].enhance do
    puts 'my assets:precompile hook is started!'
    dir_path = "#{Dir.pwd}/public/"
    records = Dir.glob("#{dir_path}**/*")
    records.each do |f|
        if f =~ /.*.png$/ or
                f =~ /.*.jpg$/ then
            File.delete(f)
        end
    end
    # puts Dir.glob("#{dir_path}**/*")
    puts 'my assets:precompile hook is finished!'
end