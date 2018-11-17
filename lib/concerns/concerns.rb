module Concerns
  module Findable
    #genre and artists class
    def find_by_name(name)
      self.all.find{|s| s.name == name}
    end

    def find_or_create_by_name(name)
      exist = self.find_by_name(name)
      unless exist
        return self.create(name)
      end
      exist
    end
  end

  module Memorable
    module ClassMethods
      def destroy_all
        self.all.clear
      end

      def create(attributes)
        klass = self.new(attributes)
        klass
      end
    end
    module InstanceMethods
      def initialize
        self.save
      end

      def save
        self.class.all << self
      end
    end
  end
end
