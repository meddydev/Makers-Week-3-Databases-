require "app"

describe Application do
  def reset_all_tables
    seed_sql = File.read("spec/seeds_app.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "music_library_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_all_tables
  end

  it "asks user for input and returns a list of albums (for input of 1)" do
    io = double(:io)
    expect(io).to receive(:puts).with("Welcome to the music library manager!").ordered
    expect(io).to receive(:puts).with("What would you like to do?\n    1 - List all albums\n    2 - List all artists").ordered
    expect(io).to receive(:puts).with("Enter your choice:").ordered
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("Here is the list of albums:")
    expect(io).to receive(:puts).with("* 1 - Doolittle")
    expect(io).to receive(:puts).with("* 2 - Waterloo")
    expect(io).to receive(:puts).with("* 3 - The English Riviera")



    app = Application.new('music_library_test', io, AlbumRepository.new, ArtistRepository.new)
    app.run
  end

  it "asks user for input and returns a list of artists (for input of 2)" do
    io = double(:io)
    expect(io).to receive(:puts).with("Welcome to the music library manager!").ordered
    expect(io).to receive(:puts).with("What would you like to do?\n    1 - List all albums\n    2 - List all artists").ordered
    expect(io).to receive(:puts).with("Enter your choice:").ordered
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("Here is the list of artists:")
    expect(io).to receive(:puts).with("* 1 - Pixies")
    expect(io).to receive(:puts).with("* 2 - ABBA")
    expect(io).to receive(:puts).with("* 3 - Metronomy")



    app = Application.new('music_library_test', io, AlbumRepository.new, ArtistRepository.new)
    app.run
  end
end