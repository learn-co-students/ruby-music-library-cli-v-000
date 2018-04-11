module Memorable
    module ClassMethods
      def destroy_all
        self.all.clear
      end

      def all
        self.all
      end
      # def count
      #   self.all.count
      # end
    end

    module InstanceMethods
      def initialize(name)
        @name = name

      end

      def save
      self.class.all << self
      end

      def create

      end
    end
end
