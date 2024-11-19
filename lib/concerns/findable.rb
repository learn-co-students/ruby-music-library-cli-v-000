require 'pry'

module Concerns::Findable
  # module ClassMethod
    def find_by_name(name)
      self.all.detect do |object|
        object.name == name
      end
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.create(name)
      else
        self.find_by_name(name)
      end
    end
  # end
end
