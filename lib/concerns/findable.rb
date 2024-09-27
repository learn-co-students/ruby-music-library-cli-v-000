# require 'pry'
module Concerns
  module Findable
  # Module code here
    def find_by_name(name)
      all.detect { |song| song.name == name }
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else self.create(name)
      end
      # binding.pry
    end

  end

end
