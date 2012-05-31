##
# A thing characteristic of its kind or illustrating a general rule: 
# it's a good example of how European action can produce results | some of these carpets are among the finest examples of the period.
#
class ExamplesController

  ##
  # Get a collection of examples:
  # 
  # @resource /examples
  #
  # @action GET
  # 
  # @optional [Boolean] highlight Show only highlighted examples.
  #
  # @response_field [Array] examples The collection of examples.  
  # @response_field [Integer] examples[].id The id of that example.
  # @response_field [String] examples[].title The title of that example.
  # @response_field [String] examples[].text The text of that example.
  # @response_field [String] examples[].highlight Information if the example is highlighted.
  #
  # @example_request {}
  # @example_request_description Just requests an index of samples. 
  # @example_response {"examples": [{"id":1, "title":"Animals", "text":"Dogs and cats are some.", "highlight":true}, {"id":2, "title":"Computers", "text":"Windows PC or Apple's Macintosh.", "highlight":false}]}
  # @example_response_description Responds with the index of examples.
  # 
  # @example_request {"highlight": true}
  # @example_request_description Request only highlighted examples.
  # @example_response 
  #   ```json
  #   {
  #     "examples": [{
  #       "id":1,
  #       "title":"Animals",
  #       "text":"Dogs and cats are some.",
  #       "highlight":true
  #     }]
  #   }
  #   ```
  # @example_response_description Responds only with highlighted examples.
  #
  def index
    #...
  end

  ##
  # Get a collection of examples:
  # 
  # @resource /examples/:id
  #
  # @action GET
  # 
  # @required [Integer] id The id of the example.
  #
  # @response_field [Integer] example.id The id of that example.
  # @response_field [String] example.title The title of that example.
  # @response_field [String] example.text The text of that example.
  # @response_field [String] example.highlight Information if the example is highlighted.
  #
  # @example_request {"id":1}
  # @example_request_description Just requests the example with id 1. 
  # @example_response 
  #   ```json
  #   {
  #     "example": {
  #       "id":1,
  #       "title":"Animals",
  #       "text":"Dogs and cats are some.",
  #       "highlight":true
  #     }
  #   }
  #   ```
  # @example_response_description Responds with the requested example.
  #
  def show
    #...
  end

  ##
  # Create an example:
  # 
  # @resource /examples
  #
  # @action POST
  # 
  # @required [Hash] example The object of the new example.
  # @required [String] example.title The title of the new example.
  # @required [String] example.text The text of the new example.
  #
  # @optional [Boolean] example.highlight The highlight status of the new example. (Default is false)
  #
  # @example_request {"example": {"title":"Fish", "text": "Angel- or Butterflyfish"}}
  # @example_resuest_description Create a new example for fish.
  # @example_response {}
  # @example_response_description Responds with an empty hash and status: 201 (Created).
  #
  def create
    #...
  end
end