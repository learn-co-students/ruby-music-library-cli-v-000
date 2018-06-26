module Concerns
  module Findable
    def find_by_name(input)
      self.all.detect {|i| i.name == input}
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create(name)
      end
    end

  end

end
