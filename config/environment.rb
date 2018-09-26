require 'bundler'
Bundler.require

module Concerns
  module Findable 
    def self.find_by_name(name)
      self.all.detect{|instance| instance.name == name}
    end
  end
end

require_all 'lib'
