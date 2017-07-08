module Concerns
  module Findable
    def find_by_name(name)
      all.detect{|item| item.name == name}
    end

    def find_or_create_by_name(name)
     if all.detect{|item| item.name == name}
       all.detect{|item| item.name == name}
     else
       self.create(name)
     end
    end
  end

end
