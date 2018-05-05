module Findable
  module ClassMethods
    def self.find_by_name(name)
      all.detect { |s| s.name = name }
    end
  end
end
