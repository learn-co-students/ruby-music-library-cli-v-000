
module Concerns
  module Findable

    def find_by_name(name)
      self.all.find {|songs| songs.name == name }
    end

    def find_or_create_by_name(name)
      if self.all.detect {|songs| songs.name == name }
      else
          self.new(name)
      end
      self.all.detect {|songs| songs.name == name }
    end

  end
  #binding.pry
end
