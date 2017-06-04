module Concerns
    module Findable
        def find_by_name(name)
            self.all.detect{ |song|
                song.name == name
            }
        end
        def find_or_create_by_name(name)
            result = find_by_name(name)
            if result.nil? 
                self.new(name).tap{ |instance|
                    instance.save
                }
            else
                result 
            end
        end

    end
end