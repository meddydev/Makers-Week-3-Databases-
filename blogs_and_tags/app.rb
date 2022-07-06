require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/tag_repository'


DatabaseConnection.connect("blog_2")

post_repo = PostRepository.new
posts = post_repo.find_by_tag("coding")

posts.each do |post|
    puts "#{post.id}: #{post.title}"
end

tag_repo = TagRepository.new
tags = tag_repo.find_by_post(2)

puts "Post with id 2 has the following tags"
tags.each do |tag|
    puts "#{tag.name}"
end