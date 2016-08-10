require 'bundler'
Bundler.require

module Concerns

  module Findable
    def find_by_name(name)
      self.all.detect {|a| a.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end

  module Memorable
    module ClassMethods
      def reset_all
        self.all.clear
      end

      def count
        self.all.count
      end
    end

    module InstanceMethods
      def initialize
        self.class.all << self
      end
    end
  end

end

require_all 'lib'
