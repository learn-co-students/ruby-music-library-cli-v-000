module Concerns

  module Findable

    def self.find_by_name(name)
      self.all.detect do |instance|
        instance.name == name
      end
    end

    def self.find_or_create_by_name(name)
      unless self.find_by_name(name)
        self.create(name)
      end
      self.all.last
    end

  end
end
