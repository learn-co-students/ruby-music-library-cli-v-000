module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect {|s| s.name == name}
    end

    def create_by_name(name)
      if !find_by_name(name)
        name = self.new(name)
      end 
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create_by_name(name)
    end

  end 
end