require_relative "./post"
require_relative "./comment"

class PostRepository
  def find_with_comments(id)
    query = "SELECT posts.id AS post_id, posts.title, posts.content AS post_content, comments.id AS comment_id,
                        comments.content AS comment_content, comments.author_name
                FROM posts
                JOIN comments
                ON posts.id = comments.post_id
                WHERE posts.id = $1;"
    params = [id]
    result_set = DatabaseConnection.exec_params(query, params)

    first_record = result_set[0]

    post = Post.new
    post.id = first_record["post_id"]
    post.title = first_record["title"]
    post.content = first_record["post_content"]

    result_set.each do |record|
      comment = Comment.new
      comment.id = record["comment_id"]
      comment.content = record["comment_content"]
      comment.author_name = record["author_name"]
      post.comments << comment
    end

    post
  end
end
