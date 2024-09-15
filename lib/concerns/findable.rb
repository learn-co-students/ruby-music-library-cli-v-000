module Concerns


  module Findable

    def find_by_name(name)
      self.all.detect {|a| a.name == name}
    end

    def find_or_create_by_name(name)
      if self.all.any?{|a| a.name == name}
        self.find_by_name(name)
      else
        self.create(name)
        self.find_by_name(name)
      end
    end

  end

end
