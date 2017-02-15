require 'pry'

module Concerns
  module Save
    module ClassMethods
      def self.all
        @@all
      end

      def self.destroy_all
        all.clear
      end

      def self.create(name)
        self.new(name).tap{|x| x.save}
      end
    end

    module InstanceMethods
      def save
        self.class.all << self
      end
    end
  end

  module Findable
    def find_by_name(name)
      all.find{ |x| x.name == name }
    end

    def find_or_create_by_name(name)
      search = find_by_name(name)
      search ? search : create(name)
    end
  end
end
