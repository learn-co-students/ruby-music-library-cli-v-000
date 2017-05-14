

module Concerns

    module Findable #thinnk of modules as behaviours not attached to a descrete concept but more the behaviours

        def find_by_name(name)
            self.all.detect{|o| o.name == name} #self is whatever object received this call is self (transfers to the class in a way)
        end
    def find_or_create_by_name(name)
             self.find_by_name(name) || self.create(name)
    end

        def add_song(song)
            @song << song
        end
    end
end