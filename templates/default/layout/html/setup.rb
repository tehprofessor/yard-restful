include Helpers::FilterHelper

def init
  @page_title = options[:title]
  super
end

def javascripts
  super + %w(js/rest_plugin.js)
end

def menu_lists
  [ { :type => 'resource', :title => "Resources", :search_title => "Resource List" },
    { :type => 'topic', :title => "Topics", :search_title => "Topic List" },
    { :type => 'file', :title => "Files", :search_title => "File List" } ]
end


def index

  legitimate_objects = @objects.select { |o| o.has_tag?('url') }
  @topics = {}

  legitimate_objects.each do |object|
    object.tags('topic').each { |topic| (@topics[topic.text] ||= []) << object }
  end

  @resources = legitimate_objects.sort_by {|o| o.tags('url').first.text }

  @overall_objects = @objects.find_all {|o| o.has_tag?('overall')}.sort_by {|o| o.tag('overall').text}

  erb(:index)
end


