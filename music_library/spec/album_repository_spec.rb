require "album_repository"
require "album"

describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read("spec/seeds_albums.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "music_library_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_albums_table
  end

  it "gets all albums" do
    repo = AlbumRepository.new
    albums = repo.all
    expect(albums.length).to eq 3
    expect(albums.first.id).to eq "1"
    expect(albums.first.title).to eq "Doolittle"
    expect(albums.first.release_year).to eq "1989"
    expect(albums.first.artist_id).to eq "1"
  end

  it "gets a single album with reference to its id" do
    repo = AlbumRepository.new
    album = repo.find(3)
    expect(album.title).to eq "The English Riviera"
    expect(album.release_year).to eq "2011"
  end

  it "creates a new album" do
    repo = AlbumRepository.new
    repo.create("Blah", 2000, 9)
    albums = repo.all
    expect(albums.last.title).to eq "Blah"
    expect(albums.last.release_year).to eq "2000"
  end

  it "deletes an album from table" do
    repo = AlbumRepository.new
    repo.delete(1)
    albums = repo.all
    expect(albums.first.title).to eq "Waterloo"
  end
end
