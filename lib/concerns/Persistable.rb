module Persistable

    module InstanceMethods
        def save #instance method
        self.class.all << self

        end
    end

    module ClassMethods
        def reset_all #class method

        self.all.clear

        end
        def count #class method
        self.all.size
        end
    end
end