module RestFilters

  def select_objects(list)
    if list
      list.
        select{ |item| item.has_tag?(:resource_object) }.
        sort_by { |s| s.name.to_s }
    end
  end

  def select_resources(list)
    if list
      list.
        select{ |object| object.meths.any?{ |x| x.has_tag?(:resource) } }.
        sort_by { |s| s.name.to_s }
    end
  end

end



