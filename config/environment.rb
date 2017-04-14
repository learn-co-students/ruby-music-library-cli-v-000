require 'bundler'
Bundler.require

module Concerns

  module Findable

    def find_by_name(name)
      self.all.detect {|o| o.name == name}
    end

    def find_or_create_by_name(name)
      if self.all.detect {|o| o.name == name}
         self
      else
          i = self.new(name)
          i.save
          self
      end
    end

  end

end

require_all 'lib'
