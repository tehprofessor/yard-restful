# Yardoc RESTful Web Service Plugin

Previous authors: [vWorkApp](http://www.vworkapp.com), [rknLA](http://github.com/rknLA), [lsegal](http://gnuu.org/), [spape](http://github.com/spape), [DerNalia](http://github.com/DerNalia)

A plugin for [Yardoc](http://yardoc.org/) that generates documentation for RESTful web services.

## Install
Bundler will reduce your headaches, so, please you that
	gem 'yard-restful' # in your gemfile

You may need to include the following dependencies as well:
	gem 'redcarpet'
	gem 'yard'

It also requires the Jeweler gem if you plan to use the rake build tasks.

You'll probably want to add these to your .gitignore as well
	/.yardoc/*/*
	/.yardoc/*
	/public/api

So you'll have to re-genenarte your API on every machine. This should encourage more up to dateness

## Execution
It is recommended that you use a .yardopts file

	--title "My API Documentation"
	--plugin rest
	--readme API_README
	--output-dir ./public/api
	app/models/**/*.rb
	app/controllers/**/*.rb

So that way, whenever you want to generate your API docs, you simply need to run only

	bundle exec yardoc


## See an API-Example

[Sample application](http://kraft001.github.com/yard-restful-sample)

## Writing Comments

The following tags are provided:

- **@restful_api** version
  Specifies the resource (controller) or object (model). This tag is compulsory, only **classes** and **methods** that include this in their comments are included in the API documentation.

- **@url** url
  Specifies the URL which someone should use to access that resource.

- **@action** action
  Specifies the http action (GET, POST, PUT etc.).

- **@required** [type] name description
  Specifies an argument that must be passed to the service. You can specify as many of these as you need.

- **@optional** [type] name description
  Specifies an optional argument that may be passed to the service. You can specify as many of these as you need.

- **@response** [type] description
  Specifies type of the response. Usually just a link to an object.

- **@response_field** [type] name description
  Further specifies the fields that are returned within the response.

- **@property** [type] name description
  A property (attribute) of an object.

### Examples

Examples should always be together in the following order: example_request, example_request_description, example_response, example_response_description (as soon as you write an example_request you need a following example_response and the other way around).

Markdown rendering for the text is activated if a tags text contains a newline (see example).

- **@example_request**
  An example of the request that is send to the service.

- **@example_request_description**
  The description text for the example request.

- **@example_response**
  An example of the response that is returned from the service.

- **@example_response_description**
  The description text for the example response.

- **@example**
  Example of an object.

  @example_response example.
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
## Ignored Documentation

This plugin only documents **classes** and **methods** with **@restful_api** tag. It does not support module documentation.

## Example:

[Sample controller](http://kraft001.github.com/yard-restful-sample/app/controllers/books_controller.rb) and [sample model](http://kraft001.github.com/yard-restful-sample/app/models/book.rb)

## Development

As always, you can see what tasks are available by running:

    rake -T

