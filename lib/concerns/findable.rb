module Concerns::Findable
    def find_by_name(name)
      self.all.detect{|n| n.name == name}
    end

    def create(name)
      created = self.new(name)
      created.save
      created
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end

end
