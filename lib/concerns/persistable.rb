module Concerns::Persistable
  module InstanceMethods
    def save
      self.class.all << self
      self.class.all.sort!{|a, b| a.name <=> b.name}
    end
  end
  module ClassMethods
    def destroy_all
      self.all.clear
    end
  end
end
