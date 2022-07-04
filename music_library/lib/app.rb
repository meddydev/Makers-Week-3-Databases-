require_relative "./album_repository"
require_relative "./artist_repository"
require_relative "./database_connection"


class Application
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    @io.puts "Welcome to the music library manager!"
    @io.puts "What would you like to do?\n1 - List all albums\n2 - List all artists"
    @io.puts "Enter your choice:"
    choice = @io.gets.chomp
    if choice == "1"
      @io.puts "Here is the list of albums:"
      @album_repository.all.each do |album|
        @io.puts "* #{album.id} - #{album.title}"
      end
    elsif choice == "2"
      @io.puts "Here is the list of artists:"
      @artist_repository.all.each do |artist|
        @io.puts "* #{artist.id} - #{artist.name}"
      end
    end
  end
end

if __FILE__ == $0
  app = Application.new(
    "music_library_test",
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end
