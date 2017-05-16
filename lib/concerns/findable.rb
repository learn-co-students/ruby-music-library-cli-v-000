module Concerns
  module Findable
    def find_by_name(name)
      all.detect do |object|
        object.name == name
      end
    end

    def find_or_create_by_name(name)
      if !self.find_by_name(name)
        self.create(name)
      else
        find_by_name(name)
      end
    end

  end
end
