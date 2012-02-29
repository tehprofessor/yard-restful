module RestFilters

  def index_objects(list)
    list = reject_without_resource(list)
    list
  end

  def reject_without_resource(list)
    list.delete_if { |object| 
      if [:class].include?(object.type)
        object.meths.detect{|x| x.has_tag? :resource}.nil?
      else 
        true
      end
    }
  end

end



