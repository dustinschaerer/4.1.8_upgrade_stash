Rake::Task["assets:precompile"].enhance do
  return "can't run in dev" if Rails.env.development?
  puts 'my assets:precompile hook is started!'
  ["#{Dir.pwd}/public/", "#{Dir.pwd}/app/assets/"].each do |dir_path|
    records = Dir.glob("#{dir_path}**/*")
    puts records
    puts Dir.glob("#{dir_path}**/*")
  end
  puts 'my assets:precompile hook is finished!'
end
