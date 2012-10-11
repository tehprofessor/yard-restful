include Helpers::ModuleHelper
include Helpers::FilterHelper

def generate_object_list
  @items = select_objects(@objects)
  @list_title = "List of Objects"
  @list_type = "object"
  generate_list_contents
end

def generate_resource_list
  @items = select_resources(@objects)
  @list_title = "List of Resources"
  @list_type = "resource"
  generate_list_contents
end

def init
  super
  asset("css/custom.css", file("css/custom.css", true))
end

