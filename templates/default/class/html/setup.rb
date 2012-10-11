def init
  @page_title = "#{object.name.to_s.gsub(/Controller/,"")} - #{options[:title]}"
  #sections :header, [T('docstring'), :method_details_list, [:fields_list], [T('method_details')]]
  sections :header, [T('docstring'), :object_details, [:fields_list], :resource_details, [:fields_list]]
end

def resource_details
  @meths = object.meths.select{|x| x.has_tag? :resource}
  erb(:resource_details)
end

