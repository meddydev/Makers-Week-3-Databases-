require_relative "./artist"

class ArtistRepository
  def all
    result_set = DatabaseConnection.exec_params("SELECT * FROM artists;", [])
    artists = []

    result_set.each do |record|
      artist = Artist.new
      artist.id = record["id"]
      artist.name = record["name"]
      artist.genre = record["genre"]
      artists << artist
    end

    artists
  end
end
