	module Fennec
		class << self
		attr_accessor :routes , :blocks ,:params,:request
	    def action(verb, path, &block)
	        (@routes ||= []) << "#{verb} #{path}"
	        (@blocks ||= []) << block
	    end

	    def response_with_layout(handler)
	    		ERB.new(File.read(handler[:layout]+".erb")).result(binding)
	    end

	    def respond_with(handler) 

	    	if handler.keys.include?(:view)
	    		if handler.keys.include?(:layout)
	    			response_with_layout(handler){
	    				ERB.new(File.read(handler[:view]+".erb")).result(binding)
	    			}
	    		else
	    			return ERB.new(File.read(handler[:view]+".erb")).result(binding)
	    		end
	    	end
	    end
		end
	end