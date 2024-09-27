require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      self.all.find {|x| x.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end

  module ClassMethods
    def destroy_all
      self.all.clear
    end
  end

end

require_all 'lib'
