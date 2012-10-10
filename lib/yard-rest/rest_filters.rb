module RestFilters

  def index_objects(list)
    list = reject_without_resource(list)
    list
  end

  def reject_without_resource(list)
    if list
      list.delete_if { |object|
        if object.has_tag?(:resource_object)
          false
        elsif object.meths.detect{ |x| x.has_tag?(:resource) }
          false
        else
          true
        end
      }
    end
  end

end



