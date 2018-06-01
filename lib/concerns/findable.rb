

module Concerns::Findable
  
  # module ClassMethods
    
    def find_by_name(object)
      self.all.detect {|o| o.name == object}
    end
  
	  def find_or_create_by_name(name)
	  	find_by_name(name) || create(name)
	  end
	  
	  def create(name)
			object = self.new(name).tap do |object|
				object.save
			end
		end

end