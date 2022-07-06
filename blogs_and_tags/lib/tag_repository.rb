require_relative "./tag"

class TagRepository
  def find_by_post(post_id)
    query = "SELECT tags.id, tags.name
    FROM tags
    JOIN posts_tags ON tags.id = posts_tags.tag_id
    JOIN posts ON posts.id = posts_tags.post_id
    WHERE posts.id = $1;"
    params = [post_id]
    result_set = DatabaseConnection.exec_params(query, params)

    tags = []

    result_set.each do |record|
      tag = Tag.new
      tag.id = record["id"].to_i
      tag.name = record["name"]
      tags << tag
    end
    tags
  end
end
