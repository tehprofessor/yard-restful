YARD::Templates::Engine.register_template_path File.dirname(__FILE__) + '/../templates'

require 'yard-rest/tags'
require 'yard-rest/rest_filters'
require 'yard-rest/html_blocks_helper'

YARD::Templates::Template.extra_includes << RestFilters
YARD::Templates::Template.extra_includes << ->(opts) { HtmlBlocksHelper if opts.format == :html }
