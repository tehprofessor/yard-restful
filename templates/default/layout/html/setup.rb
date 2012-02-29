include Helpers::FilterHelper

def init
  @page_title = options[:title]
  if object == "_index.html"
    # we dont need the _index
  elsif object.name == :root
    sections :layout, [:index]
  else
    super
  end
end

def javascripts
  super + %w(js/rest_plugin.js)
end

def menu_lists
  [ { :type => 'resource', :title => "Resources", :search_title => "List of Resources" },
    { :type => 'topic', :title => "Topics", :search_title => "Topic List" },
    { :type => 'file', :title => "Files", :search_title => "File List" } ]
end

def index
  path_to_readme = "./doc/README_FOR_API"
  @readme = YARD::CodeObjects::ExtraFileObject.new(path_to_readme) if File.exists?(path_to_readme)
  erb(:index)
end