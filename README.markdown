# Yardoc RESTful Web Service Plugin

originally by [vWorkApp](http://www.vworkapp.com)
rewritten for 0.3.0 by [rknLA](http://github.com/rknLA) with substantial help from [lsegal](http://gnuu.org/)
customized by [spape](http://github.com/spape) for the [MAdeK](http://github.com/zhdk/madek) [API-Documentation](http://medienarchiv.zhdk.ch/api)

A plugin for [Yardoc](http://yardoc.org/) that generates documentation for RESTful web services. 

## Install
    sudo gem install yard-rest

It also requires the Jeweler gem if you plan to use the rake build tasks.

## Fast Example

Run 'rake ex:generate' inside this plugin folder and get a look to the generated doc/index.html.

## Demo

Visit [MAdeK-Api-Documetnation](http://medienarchiv.zhdk.ch/api) for a demonstration. Or visit ROR project [MAdeK](http://github.com/zhdk/madek) on github to see how we document our api.

## Generating Docs

When using yardoc you ask it to use the "rest" plugin (the --plugin option). For example: 

    yardoc --plugin rest --title "Our App's API" --readme "./doc/README_FOR_API"

## Publish API

When you want to make the API-documentation available for public use the following command:

    bundle exec yardoc --plugin rest --title 'Our App's API' --readme "./doc/README_FOR_API" --output-dir ./public/api

## Gemfile functionality

You may also include yard-rest in your gemfile using:

    gem 'yard-rest'

You may need to include the following dependencies as well:

    gem 'redcarpet'
    gem 'yard', '~>0.8.1'

If you include yard-rest in your gemfile, you should generate docs using bundle exec:

    bundle exec yardoc --plugin rest --title "Our App's API" --readme "./doc/README_FOR_API"

## Writing Comments

In addition to starting your comment with the normal RDoc description. The following tags are provided:

- @resource resource. Specifies the resource (URL) that the service is accessed from. This tag is compulsory, only **classes** and **methods** that include this in their comments are included in the API documentation.

- @action action. Specifies the http action (GET, POST, PUT etc.).

- @required [type] name description. Specifies an argument that must be passed to the service. You can specify as many of these as you need.

- @optional [type] name description. Specifies an optional argument that may be passed to the service. You can specify as many of these as you need. 

- @response_field [type] name description. Further specifies the fields that are returned within the response.

### Examples

Examples should always be together in the following order: example_request, example_request_description, example_response, example_response_description (as soon as you write a example_request you need a following example_response and the other way around).

Markdown rendering for the text is activated if a tags text contains a newline (see example).

- @example_request example. An example of the request that is send to the service.

- @example_request_description description. The description text for the example request.

- @example_response example. An example of the response that is returned from the service.

- @example_response example.
    ```json
    {
      "examples": [{
        "id":1,
        "title":"Animals",
        "text":"Dogs and cats are some.",
        "highlight":true
       }]
    }
    ```

- @example_response_description example. The description text for the example response.

## Ignored Documentation

This plugin only documents **classes** and **methods** with **@resource** tags. It does not support module documentation.

The rationale here is that you are documenting external services (as represented by controllers and methods), and not internal code.

Both controller *and* methods must have @resource tags to be included in documentation.

## Example:

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

## Development

As always, you can see what tasks are available by running:
    
    rake -T

You can run the template locally over the included sample code by using the following rake tasks:
    
    rake ex:clean
    rake ex:generate



