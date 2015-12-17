module Concerns

  module Findable
    def find_by_name(name)
      self.all.detect {|x| x.name == name}  # self is the class; iterates over the class variable all, finds the element with name property that matches name argument
    end

    def find_or_create_by_name(name)
      find_by_name(name) || self.create(name)
    end
  end

end