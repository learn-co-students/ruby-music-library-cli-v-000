module Concerns::Findable

    def find_by_name(name)
      self.all.find {|obj| obj.name == name}
    end# of find_by_name


    def find_or_create_by_name(name)
      if find_by_name(name) == nil
        self.create(name)
      else 
        find_by_name(name) 
      end# of if 
    end# of find_or_create_by_name

end