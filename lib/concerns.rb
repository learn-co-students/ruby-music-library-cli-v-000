module Concerns

  module Findable
    def find_by_name(input)
      self.all.detect {|s| s.name == input}
    end

    def find_or_create_by_name(input)
      self.find_by_name(input) || self.create(input)
    end
  end
end
