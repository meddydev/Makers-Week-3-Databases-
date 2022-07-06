require "tag_repository"

describe TagRepository do
  def reset_tables
    seed_sql = File.read("spec/seeds.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "blog_2_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  it "returns list of tags associated with a post" do
    repo = TagRepository.new
    tags = repo.find_by_post(2)

    expect(tags.length).to eq 2
    expect(tags.first.id).to eq 1
    expect(tags.first.name).to eq "coding"
    expect(tags.last.id).to eq 4
    expect(tags.last.name).to eq "ruby"
  end
end
