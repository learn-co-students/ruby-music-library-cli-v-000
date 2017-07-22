module Concerns
  module Findable
    def find_by_name(name)
      self.all.find{|object| object.name == name}
    end

    def create(name)
      self.new(name).tap{|object| object.save}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end

    def destroy_all
      self.all.clear
    end
  end

  module Saveable
    def save
      self.class.all.push(self)
    end

    def initialize(name)
      self.name = name
    end
  end

end
