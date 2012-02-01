def init
  sections :header, [T('docstring'), :method_details_list, [T('method_details')]]
end

def method_details_list
  @meths = object.meths(:inherited => false, :included => false) 
  erb(:method_details_list)
end
