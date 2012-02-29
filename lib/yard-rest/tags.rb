# Define custom tags
YARD::Tags::Library.define_tag("URL for the Resource",          :resource)
YARD::Tags::Library.define_tag("HTTP-Action for the Resource",  :action)

YARD::Tags::Library.define_tag("Required Arguments",            :required,          :with_types_and_name)
YARD::Tags::Library.define_tag("Optional Arguments",            :optional,          :with_types_and_name)

YARD::Tags::Library.define_tag("Example Request",               :example_request)
YARD::Tags::Library.define_tag("Request Fields",                :request_field,     :with_types_and_name)

YARD::Tags::Library.define_tag("Example Response",              :example_response)
YARD::Tags::Library.define_tag("Response Fields",               :response_field,    :with_types_and_name)

YARD::Tags::Library.define_tag("Headers",                       :header, :with_name)