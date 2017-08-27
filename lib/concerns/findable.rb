module Concerns
  module Findable
    def sorted
      self.all.sort do |x, y|
        x.name <=> y.name
      end
    end
    def destroy_all
      self.all.clear
    end
    def find_by_name(name)
      self.all.detect do |song|
        song.name == name
      end
    end
    def find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)

      else
        self.create(name)
      end
    end
    module InstanceMethods
      def initialize(name)
        self.name = name
      end
      def save
        self.class.all << self
      end
    end
  end
end
