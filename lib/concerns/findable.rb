module Concerns
  
  module Creatable
    def self.extended(base)
      base.class_variable_set(:@@all, [])
    end
  end

  module Findable
    def find_by_name(name)
      self.all.detect {|song| song.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end
end
