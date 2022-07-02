require "post_repository"

describe PostRepository do
  def reset_posts_table
    seed_sql = File.read("spec/seeds_posts.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "social_network_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_posts_table
  end

  it "retrieves all posts" do
    repo = PostRepository.new

    posts = repo.all

    expect(posts.length).to eq 3
    expect(posts.first.views).to eq 8
    expect(posts.first.user_account_id).to eq 1
    expect(posts.last.content).to eq "I am Jim and I love cars"
    expect(posts.last.title).to eq "Cars"
  end

  it "finds a post with reference to its id" do
    repo = PostRepository.new
    post = repo.find(3)

    expect(post.id).to eq 3
    expect(post.user_account_id).to eq 2
    expect(post.views).to eq 1000
  end

  it "adds a new post to database" do
    new_post = Post.new
    new_post.title = "What I learnt during the Pre-Course"
    new_post.content = "Lots of stuff!"
    new_post.views = 58000
    new_post.user_account_id = 3

    repo = PostRepository.new
    repo.create(new_post)

    expect(repo.all.length).to eq 4
    expect(repo.find(4).user_account_id).to eq 3
    expect(repo.all.last.content).to eq "Lots of stuff!"
  end

  it "updates all post info (apart from id)" do
    repo = PostRepository.new
    post = repo.find(1)

    post.title = "whatevs"
    post.content = "more random business"
    post.views = 0
    post.user_account_id = 3

    repo.update(post)

    new_post = repo.find(1)

    expect(new_post.id).to eq 1
    expect(new_post.title).to eq "whatevs"
    expect(new_post.views).to eq 0
    expect(new_post.user_account_id).to eq 3
    expect(new_post.content).to eq "more random business"
  end

  it "updates the title while keeping everything else the same for a post" do
    repo = PostRepository.new
    post = repo.find(1)

    post.title = "New titular concept"

    repo.update(post)

    new_post = repo.find(1)

    expect(new_post.title).to eq "New titular concept"
    expect(new_post.content).to eq "Hi my name is Abbie!"
    expect(new_post.views).to eq 8
    expect(new_post.user_account_id).to eq 1
  end

  it "deletes a post entry" do
    repo = PostRepository.new
    repo.delete(3)

    expect(repo.all.length).to eq 2
    expect(repo.all.last.views).to eq 80
    expect(repo.all.last.content).to eq "My name is  still Abbie!"
  end

  it "deletes all posts" do
    repo = PostRepository.new
    repo.delete(1)
    repo.delete(2)
    repo.delete(3)

    expect(repo.all.length).to eq 0
  end
end
