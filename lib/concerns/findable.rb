module Concerns::Findable
    def self.find_by_name(name)
      self.all.detect { |member| member.name == name}
    end

    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
end
