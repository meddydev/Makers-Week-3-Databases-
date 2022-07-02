require_relative "lib/database_connection"
require_relative "lib/post_repository"

DatabaseConnection.connect("social_network")

repo = PostRepository.new
posts = repo.all

posts.each do |post|
  puts "#{post.title}: #{post.content}" if post.user_account_id == 1
end
