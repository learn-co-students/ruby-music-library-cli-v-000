module Concerns
  module Findable
    def find_by_name(name)
      if  self.all.find {|song| song.name == name}
        song
      end
    end
  end
end
