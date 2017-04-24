module Concerns
  module Findable
      def find_by_name(name)
        all.detect{|model| model.name==name}
      end
      def find_or_create_by_name(name)
        model = find_by_name(name)
        if !model
          model = self.new(name)
          model.save
        end
        model
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
        model = self.new(name)
        model.save
        model
      end
      def destroy_all
        self.all.clear
      end
    end
  end
end
