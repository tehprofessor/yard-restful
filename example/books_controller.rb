# @restful_api 1.0
#
# Books and articles
#
class BooksController

  # @url /books
  # @action POST
  #
  # Create new book
  #
  # @required [Integer] author_id Identifier of an author
  # @required [String] title Title of the book
  # @optional [Integer] year Imprint year
  # @optional [String] genre Genre of the story
  #
  # @response [Book] The created book
  #
  # @example_request_description Let's try to create a book
  # @example_request
  #   ```json
  #   {
  #     "author_id": 1,
  #     "title": "My first book",
  #     "year": 1999
  #   }
  #   ```
  # @example_response_description The book should be created correctly
  # @example_response
  #   ```json
  #   {
  #     "author": {
  #       "name": "Petr Petrov",
  #       "birthdate": "1968-03-25"
  #     },
  #     "title": "My first book",
  #     "year": 1999,
  #     "genre": ""
  #   }
  #   ```
  def create
    # ...
  end

  # @url /books/:id
  # @action GET
  #
  # View a book
  #
  # @required [Integer] id Identifier the book
  #
  # @response [Book] The requested book
  #
  def show
    # ...
  end

  # @url /books
  # @action GET
  #
  # View list of all books
  #
  # @optional [Integer] year Filter books by imprint date
  #
  # @response [Array<Book>] List of books
  #
  def index
    # ...
  end
end
