include Helpers::FilterHelper

def init
  #possibly run the verifier again here?
  super
end

def contents
  @contents
end

def menu_lists
  [ { :type => 'resource', :title => "Resources", :search_title => "Resource List" },
    { :type => 'topic', :title => "Topics", :search_title => "Topic List" },
    { :type => 'file', :title => "Files", :search_title => "File List" } ]
end

