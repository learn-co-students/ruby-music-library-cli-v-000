module Concerns::Findable
  module ClassMethods
    def find_by_name(name)
      self.all.detect { |item| item.name == name }
    end

    def find_or_create_by_name(name)
      if find_by_name(name) == nil
        self.create(name)
      else
        find_by_name(name)
      end
    end
  end
end
