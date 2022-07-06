require_relative "./post"
require_relative "./tag"

class PostRepository
  def find_by_tag(tag_name)
    query = "SELECT posts.id, posts.title
            FROM posts
            JOIN posts_tags ON posts_tags.post_id = posts.id
            JOIN tags ON posts_tags.tag_id = tags.id
            WHERE tags.name = $1;"
    params = [tag_name]
    result_set = DatabaseConnection.exec_params(query, params)

    posts = []

    result_set.each do |record|
      post = Post.new
      post.id = record["id"].to_i
      post.title = record["title"]
      posts << post
    end

    posts
  end
end
