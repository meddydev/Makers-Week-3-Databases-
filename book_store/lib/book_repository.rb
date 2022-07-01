require_relative "./book"

class BookRepository
  def all
    sql = "SELECT * FROM books;"
    result_set = DatabaseConnection.exec_params(sql, [])
    books = []
    result_set.each do |entry|
      book = Book.new
      book.id = entry["id"]
      book.title = entry["title"]
      book.author_name = entry["author_name"]
      books << book
    end
    books
  end
end
