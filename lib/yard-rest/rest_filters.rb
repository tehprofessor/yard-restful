module YARD
    module CodeObjects
      class Base
        def restful?
          has_tag?(:restful_api) #&& tag(:restful_api).text == options.restful_api
        end
        def resource?
          meths.any?{ |m| m.has_tag?(:url) }
        end
      end
    end
end

module RestFilters

  def select_restful(list)
    (list || []).select(&:restful?)
  end

  def select_objects(list)
    select_restful(list).reject(&:resource?).sort_by(&:name)
  end

  def select_resources(list)
    select_restful(list).select(&:resource?).sort_by(&:name)
  end

end

