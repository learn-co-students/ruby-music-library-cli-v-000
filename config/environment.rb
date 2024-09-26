require 'bundler'
Bundler.require

require_relative '../lib/concerns/findable.rb'
#require_relative '../lib/concerns/memorable.rb'
#require_relative '../lib/concerns/paramable.rb'


module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect{|a| a.name == name}
    end

  end

end

require_all 'lib'
