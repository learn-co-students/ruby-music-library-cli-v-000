module Concerns

    module Findable

        @@all = []

        def find_by_name(name)
            self.all.detect {|o| o.name == name}
        end

        def find_or_create_by_name(name)
            unless self.all.any? {|o| o.name == name}
                self.create(name)
            end
            self.find_by_name(name)
        end
    end

end