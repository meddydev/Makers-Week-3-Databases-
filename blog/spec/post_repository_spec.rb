require "post_repository"

describe PostRepository do
    def reset_all_tables
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_test' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_all_tables
    end

    it "finds a post and its associated comments" do
        repo = PostRepository.new

        post = repo.find_with_comments(1)
        expect(post.title).to eq "My first blog!"
        expect(post.content).to eq "This is the contents of my first blog."
        expect(post.comments.length).to eq 2
        expect(post.comments.first.author_name).to eq "Steve"
        expect(post.comments.last.content).to eq "Hope it goes well!"
    end
end