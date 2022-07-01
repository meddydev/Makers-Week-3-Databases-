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

  it "returns a single album when its is referenced" do
    repo = AlbumRepository.new
    album0 = repo.find(3)
    album1 = repo.find(1)
    expect(album0.title).to eq "The English Riviera"
    expect(album0.release_year).to eq "2011"
    expect(album1.title).to eq "Doolittle"
    expect(album1.release_year).to eq "1989"
  end

  it "creates a new album" do
    repo = AlbumRepository.new
    
    album = Album.new
    album.title = "Trompe le Monde"
    album.release_year = 1991
    album.artist_id = 1
    
    repo.create(album)

    all_albums = repo.all
    expect(all_albums.last.title).to eq "Trompe le Monde"
    expect(all_albums.last.release_year).to eq "1991"
    expect(all_albums.length).to eq 4
  end

  it "deletes an album from table" do
    repo = AlbumRepository.new
    repo.delete(1)
    albums = repo.all
    expect(albums.first.title).to eq "Waterloo"
  end
end
