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

def index

  legitimate_objects = index_objects(@objects).reject {|o| o.root? }
  @topics = {}

  legitimate_objects.each do |object|
    object.tags('topic').each { |topic| (@topics[topic.text] ||= []) << object }
  end

  @resources = legitimate_objects.sort_by {|o| o.tags('url').first.text }

  @overall_objects = @objects.find_all {|o| o.has_tag?('overall')}.sort_by {|o| o.tag('overall').text}

  erb(:index)
end

def diskfile
  "<div id='filecontents'>" +
  case (File.extname(@file)[1..-1] || '').downcase
  when 'htm', 'html'
    @contents
  when 'txt'
    "<pre>#{@contents}</pre>"
  when 'textile', 'txtile'
    htmlify(@contents, :textile)
  when 'markdown', 'md', 'mdown', 'mkd'
    htmlify(@contents, :markdown)
  else
    htmlify(@contents, diskfile_shebang_or_default)
  end +
  "</div>"
end

def diskfile_shebang_or_default
  if @contents =~ /\A#!(\S+)\s*$/ # Shebang support
    @contents = $'
    $1.to_sym
  else
    options[:markup]
  end
end
