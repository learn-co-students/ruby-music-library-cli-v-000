module Concerns

  module ClassMethods

    def destroy_all
      self.all.clear
    end

    def create(name)
      self.new(name).tap{|a| a.save}
    end
  end

  module InstanceMethods
    def initialize(name)
      self.name=name
    end

    def save
      self.class.all<<self
    end
  end

  module Findable
    def find_by_name(name)
      self.all.find {|song| song.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end
  end
end
