module RestFilters

  def select_objects(list)
    list.select{ |item| item.has_tag?(:resource_object) } if list
  end

  def select_resources(list)
    if list
      list.select do |object|
        object.meths.any?{ |x| x.has_tag?(:resource) }
      end
    end
  end

end



