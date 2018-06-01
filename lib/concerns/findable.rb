

module Concerns::Findable
  
  # module ClassMethods
    
    def find_by_name(object)
      self.all.detect {|o| o.name == object}
    end
  
	  def find_or_create_by_name(name)
	  	find_by_name(name) || create(name)
	  end
	  
	  def create(obj)
			object = self.new(obj).tap do |object|
				object.save
			end
		end

end