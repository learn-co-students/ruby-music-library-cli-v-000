module Concerns
  module Findable
    def find_by_name(name)
      if  y =  self.all.find {|x| x.name == name}
        y
      end
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create(name)
      end
    end

  end
end
