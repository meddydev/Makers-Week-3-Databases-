require "post_repository"

describe PostRepository do
  def reset_all_tables
    seed_sql = File.read("spec/seeds.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "blog_2_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_all_tables
  end

  it "returns posts with reference to a tag name" do
    repo = PostRepository.new
    posts = repo.find_by_tag("coding")

    expect(posts.length).to eq 4
    expect(posts.first.title).to eq "How to use Git"
    expect(posts.first.id).to eq 1
    expect(posts.last.title).to eq "SQL basics"
    expect(posts.last.id).to eq 7
  end
end
