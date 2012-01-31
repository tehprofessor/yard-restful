include Helpers::ModuleHelper
include Helpers::FilterHelper


def generate_topic_list
  @items = Registry.all(:topic)
  @list_title = 'Topic List'
  @list_type = 'topic'

  asset('topic_list.html', erb(:full_list_topic))
end

def generate_resource_list
  @items = Registry.all(:resource)
  @list_title = "Resource List"
  @list_type = "resource"
  asset('resource_list.html', erb(:full_list_resource))
end

