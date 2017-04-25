module Concerns
  module Findable
      def find_by_name(name)
        all.detect{|o| o.name==name}
      end
      def find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end
  end
  module Memorable
    module InstanceMethods
      def save
        self.class.all<<self
      end
    end
    module ClassMethods
      def create(name)
        o = self.new(name)
        o.save
        o
      end
      def destroy_all
        self.all.clear
      end
    end
  end
end
