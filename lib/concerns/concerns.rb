module Concerns
  module ClassMethods
    def destroy_all
      all.clear
    end

    def create(name)
      new(name).tap { |s| s.save }
    end
  end

  module Findable
    def find_by_name(name)
      all.detect{ |s| s.name == name }
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end
  end
end
