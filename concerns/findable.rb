
module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect { |i| i.name == name }
    end

    def find_or_create_by_name(name)
      existing_ind = self.all.detect { |i| i.name == name }
      if existing_ind
        return existing_ind
      else
        self.create(name)
      end
    end

  end
end
