include Helpers::ModuleHelper
include Helpers::FilterHelper

def generate_object_list
  @items = index_objects(@objects)
  @list_title = "List of Objects"
  @list_type = "object"
  asset('object_list.html', erb(:full_list))
end

def generate_resource_list
  @items = index_objects(@objects)
  @list_title = "List of Resources"
  @list_type = "resource"
  asset('resource_list.html', erb(:full_list))
end

def init
  super
  asset("css/custom.css", file("css/custom.css", true))
end

