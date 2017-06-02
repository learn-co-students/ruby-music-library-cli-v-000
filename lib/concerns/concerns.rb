require_relative "../song.rb"
module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect{|a| a.name == name}
    end
    def find_or_create_by_name(name)
      a = self.all.detect{|instance| instance.name == name}

      if(a.nil?)
        return self.create(name)
      end
      return a
    end
    def destroy_all
      self.all.clear
    end
    def create(name)
      self.new(name).tap{|a| a.save}
    end
  end
  module InstanceMethods
    def save
      self.class.all << self
    end
  end
end
