module Concerns

  module Findable
    def find_by_name(name)
      self.all.detect {|item| item.name == name }
    end

    def find_or_create_by_name(name)
      result = self.find_by_name(name)
      if result == nil
        self.create(name)
      else
        result
      end
    end

  end

end#endof Concerns
