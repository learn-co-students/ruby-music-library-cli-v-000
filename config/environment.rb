require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect{|obj|obj.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) == nil ? self.create(name) : self.find_by_name(name)
    end

  end

  module ClassMethods

      def destroy_all
        self.all.clear
      end

      def create(name)
          name = self.new(name)
          name.save
          name
      end
  end

  module InstanceMethods
    attr_accessor :name
      def initialize (name)
        @name = name
      end

      def save
        self.class.all << self
      end
    end

end

require_all 'lib'
