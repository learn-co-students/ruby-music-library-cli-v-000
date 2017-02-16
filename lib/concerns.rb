module Concerns
    module Findable

        def find_by_name(name)
            all.find do |item|
                item.name == name
            end
        end

        def find_or_create_by_name(name)
            if !find_by_name(name)
                item = self.create(name)
            else
                item = self.find_by_name(name)
            end
            return item
        end
    end
end