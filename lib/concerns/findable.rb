module Concerns::Findable

    def find_by_name(name)
      self.all.detect { |item| item.name == name }
    end

    def find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      elsif !self.all.include?(name)
        create(name)
      end
    end

end
