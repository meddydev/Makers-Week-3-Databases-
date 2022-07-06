require_relative "lib/database_connection"
require_relative "lib/post_repository"

DatabaseConnection.connect("blog_test")

repo = PostRepository.new
first_post = repo.find_with_comments(1)

puts "Blog Title: #{first_post.title}\nContents: #{first_post.content}\n\nComments:"

first_post.comments.each do |comment|
  puts "\nAuthor: #{comment.author_name}\n#{comment.content}"
end
