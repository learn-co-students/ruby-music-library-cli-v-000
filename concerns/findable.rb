module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect{|obj| obj.name == name}
    end

    def find_or_create_by_name(name)
      if !self.find_by_name(name) == name;
        create(name)
        else
      end
    end

  end

end