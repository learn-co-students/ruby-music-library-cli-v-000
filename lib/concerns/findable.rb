module Concerns::Findable
  module ClassMethods
    def find_by_name(name)
      self.all.detect{|o| o.name = name}
    end

    def find_or_create_by_name(name)
      self.all.find {|a| a.name == name} || new.(name)
    end
  end
end
