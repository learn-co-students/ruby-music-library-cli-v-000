module Concerns

    module Findable

        def find_by_name(name)
            self.all.find {|song| song.name == name}
        end

        def find_or_create_by_name(name)
            if self.all.find {|song| song.name == name}
                self.all.find {|song| song.name == name}
            else
                created_by_name = self.new(name)
                self.all << created_by_name
                created_by_name
            end
        end

    end

end