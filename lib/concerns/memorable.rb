
module Concerns::Memorable

  module ClassMethods

    def create(name)
      item = self.new(name)
      item.save
      item
    end

    def destroy_all
      self.all.clear
    end
  end

  module InstanceMethods

    def initialize(name, artist = nil, genre = nil)
      self.name = name
    end

    def save
      self.class.all << self
    end
  end

end
