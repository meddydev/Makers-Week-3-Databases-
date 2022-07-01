require_relative "./album"

class AlbumRepository
  def all
    result_set = DatabaseConnection.exec_params("SELECT * FROM albums;", [])
    @albums = []

    result_set.each do |record|
      album = Album.new
      album.id = record["id"]
      album.title = record["title"]
      album.release_year = record["release_year"]
      album.artist_id = record["artist_id"]
      @albums << album
    end

    @albums
  end

  def find(id)
    result_set = DatabaseConnection.exec_params("SELECT * FROM albums WHERE id = #{id};", [])
    record = result_set[0]
    album = Album.new
    album.id = record["id"]
    album.title = record["title"]
    album.release_year = record["release_year"]
    album.artist_id = record["artist_id"]
    album
  end

  def create(title, release_year, artist_id)
    DatabaseConnection.exec_params("INSERT INTO albums (title, release_year, artist_id) VALUES('Blah', 2000, 9);", [])
  end

  def delete(id)
    DatabaseConnection.exec_params("DELETE FROM albums WHERE id = #{id};", [])
  end
end
