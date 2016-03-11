module Concerns::Print
  module ClassMethods
    def print_all
      self.all.each{|item| puts item.name}
    end
  end
  module InstanceMethods
    def print
      puts self.name
    end
  end
end
