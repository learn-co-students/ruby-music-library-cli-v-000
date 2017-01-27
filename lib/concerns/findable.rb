module Concerns
  module Findable

    def find_by_name(name)
      matches = []
      self.all.detect {|x| x.name == name}
    end

    def find_or_create_by_name(name)
      self.all.detect{|x| x.name == name} || self.new(name)
    end

  end
end
