require "book_repository"

describe BookRepository do
  def reset_books_table
    seed_sql = File.read("spec/seeds_books.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "book_store_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_books_table
  end

  it "gets all books and their information" do
    book_repository = BookRepository.new

    books = book_repository.all

    expect(books.length).to eq 2

    expect(books.first.id).to eq "1"
    expect(books.first.title).to eq "Nineteen Eighty-Four"
    expect(books.first.author_name).to eq "George Orwell"

    expect(books.last.id).to eq "2"
    expect(books.last.title).to eq "Emma"
    expect(books.last.author_name).to eq "Jane Austen"
  end
end
