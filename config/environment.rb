require 'bundler'
Bundler.require

<<<<<<< HEAD
module Concerns
  module Findable
    def find_by_name(name)
      self.all.find { |element| element.name == name}
    end
    def find_or_create_by_name(name)
      found = self.find_by_name(name)
      if found == nil
        self.create(name)
      else
        found
      end
    end
  end
end

require_all 'lib'
=======
require_all 'lib'
>>>>>>> 7d857eab89be25cace416fda944031753dce8f3d
