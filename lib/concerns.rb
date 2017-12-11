module Concerns
  module Findable
    def find_by_name(name)
      if  self.all.find {|song| song.name == name}
        self
      end
    end
  end
end
