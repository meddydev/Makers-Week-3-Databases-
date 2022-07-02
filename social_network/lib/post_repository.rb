require_relative "./post"

class PostRepository
  def all
    query = "SELECT * FROM posts;"
    result_set = DatabaseConnection.exec_params(query, [])

    posts = []

    result_set.each do |record|
      posts << record_to_post_object(record)
    end
    posts
  end

  def find(id)
    query = "SELECT * FROM posts WHERE id = $1;"
    params = [id]

    result_set = DatabaseConnection.exec_params(query, params)
    record = result_set[0]

    record_to_post_object(record)
  end

  def create(post)
    query = "INSERT INTO posts (title, content, views, user_account_id) VALUES($1, $2, $3, $4);"
    params = [post.title, post.content, post.views, post.user_account_id]

    DatabaseConnection.exec_params(query, params)
  end

  def update(post)
    query = "UPDATE posts SET title = $1, content = $2, views = $3, user_account_id = $4 WHERE id = $5;"
    params = [post.title, post.content, post.views, post.user_account_id, post.id]

    DatabaseConnection.exec_params(query, params)
  end

  def delete(id)
    query = "DELETE FROM posts WHERE id = $1;"
    params = [id]

    DatabaseConnection.exec_params(query, params)
  end

  private

  def record_to_post_object(record)
    post = Post.new
    post.id = record["id"].to_i
    post.title = record["title"]
    post.content = record["content"]
    post.views = record["views"].to_i
    post.user_account_id = record["user_account_id"].to_i

    post
  end
end
