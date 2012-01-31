include Helpers::ModuleHelper
include Helpers::FilterHelper

def init
  super
  log.debug "Initializing rknLA/yard-rest-plugin fulldoc setup"
  log.debug "Serializer: " + options[:serializer].to_s
  log.debug "Ancestors: " + self.class.ancestors.to_s
end


def generate_topic_list
  @items = Registry.all(:topic)
  @list_title = 'Topic List'
  @list_type = 'topic'

  #topic_objects = index_objects(options[:objects]).reject { |o| o.root? }
  #@topics = {}

  #topic_objects.each do |object|
  #  object.tags('topic').each { |topic| (@topics[topic.text] ||= []) << object }
  #end

  #@list_title = "Topic List"
  #@list_type = "topic"
  asset('topic_list.html', erb(:full_list))
end

def generate_resource_list
  @items = Registry.all(:resource)
  @list_title = "Resource List"
  @list_type = "resource"
  asset('resource_list.html', erb(:full_list))
end

