module Concerns
  module Findable
    def find_by_name(name)
      self.all.find{|o| o.name == name} #self was optional here...huh...
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name) #selves optional here too.
    end
  end
end
