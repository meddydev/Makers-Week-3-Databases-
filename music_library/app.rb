require_relative "lib/database_connection"
require_relative "lib/album"
require_relative "lib/album_repository"

DatabaseConnection.connect("music_library")

repo = AlbumRepository.new
albums = repo.all

albums.each do |album|
  p album
end
