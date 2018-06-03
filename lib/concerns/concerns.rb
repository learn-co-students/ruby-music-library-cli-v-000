module Concerns
  # class method
  module Nameable
    def create(name)
      new(name).tap {|o| o.save}
    end
  end
    
  # class methods
  module Findable
    def find_by_name(name)
      all.find {|i| i.name == name}
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end
  end
    
  module Persistable
    module InstanceMethods
      def save
        self.class.all << self
      end
    end
  
    module ClassMethods
      def self.extended(base)
        base.class_variable_set(:@@all, [] )
      end

      def destroy_all
        all.clear
      end
    end
  end
end
