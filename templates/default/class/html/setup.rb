def init
  @page_title = "#{object.name.to_s.gsub(/Controller/,"")} - #{options[:title]}"
  sections :header, [T('docstring'), :method_details_list, [T('method_details')]]
end

def method_details_list
  objects = Array(object)
  objects_with_resources_tags = select_resources(objects)
  @meths = []
  unless objects_with_resources_tags.empty?
    objects_with_resources_tags.each do |obj|
      @meths += obj.meths.select{|x| x.has_tag? :resource}
    end
  end
  erb(:method_details_list)
end
