module Concerns
    module Findable
        def initialize(name, second= nil)
            self.name = name
            self.class.all << self
        end

        def save
            self.class.all<<self
        end
    end

    module ClassMods

        def destroy_all
            all.clear
        end

        def create(name)
            temp=new(name)
            temp.save
            temp
        end

    end
end
