module Persistable

    module InstanceMethods
        def save # Instance method
            self.class.all << self
        end
      end

    module ClassMethods
        def reset_all
            self.all.clear
        end
      end

      def self.count # class Method
        self.size
      end
end
