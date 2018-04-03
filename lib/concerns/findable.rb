module Concerns::Findable

    ## tries to find the object by the name provided
    def find_by_name(name)
      self.all.detect {|object| object.name == name}
    end # .find_by_name


    ## tries to find the object.
    ## If false or nil, creates the object.
    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end # .find_or_create_by_name

end # module Concerns::Findable
