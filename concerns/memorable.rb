module Concerns
  module Memorable
    module ClassMethods
      def destroy_all
        self.all.clear
      end

      def create(name)
        self.new(name).save
      end
    end

    module InstanceMethods
      def save
        self.class.all << self
        self
      end
    end
  end
end
