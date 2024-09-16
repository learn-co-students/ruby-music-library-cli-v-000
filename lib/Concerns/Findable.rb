module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect do |x|
        x.name == name
      end
    end

    def find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      else
        create(name)
      end
    end
  end
end
