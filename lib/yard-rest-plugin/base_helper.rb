require 'pp'

module YARD::Templates::Helpers
  module BaseHelper

    # Adds additional test that only includes Objects that contain a URL tag
    def run_verifier(list)
        
      if options[:verifier]
        list = list.reject {|item| options[:verifier].call(item).is_a?(FalseClass) }
      end

	  list = reject_module(list)
      list = reject_without_url(list)
    end


    def reject_module(list)
    	list.reject { |object| true }
    	list.reject { |object| [:root, :module].include?(object.type) }
	end
	
    def reject_without_url(list)
      list.reject  { |object| [:class,:method].include?(object.type) and object.tags("url").empty? }
    end
    
  end
end