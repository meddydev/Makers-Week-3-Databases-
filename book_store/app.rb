require_relative "lib/database_connection"
require_relative "lib/book_repository"

# We need to give the database name to the method `connect`.
DatabaseConnection.connect("book_store")

book_repository = BookRepository.new
books = book_repository.all

books.each do |book|
  p "#{book.id} - #{book.title} - #{book.author_name}"
end

# Perform a SQL query on the database and get the result set.
# sql = "SELECT * FROM books;"
# result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
# result.each do |record|
#   p record
# end

# 1 - Nineteen Eighty-Four - George Orwell
# 2 - Mrs Dalloway - Virginia Woolf
# 3 - Emma - Jane Austen
# 4 - Dracula - Bram Stoker
# 5 - The Age of Innocence - Edith Wharton
