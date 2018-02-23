module Persistable

	module ClassMethods

	    def destroy_all
	     self.all.clear
	    end

	    def create(name)
	     obj = self.new(name)
	     obj.save
	     obj
	    end
	end 

	module InstanceMethods

  	  def save
  	    self.class.all << self
  	  end
  end

end
