module Concerns

  module Findable

    def find_by_name(name)
      self.all.detect{|x| x.name == name}
    end

    def find_or_create_by_name(name)
      if self.all.detect{|x| x.name == name}
       self.all.detect{|x| x.name == name}
     else
       self.new(name)
     end
    end

  end

end
