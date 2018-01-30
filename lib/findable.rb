module Concerns

  module Findable

    def find_by_name(name)
      self.all.each do |el|
        return el if el.name = name
      end
    end

    def find_or_create_by_name(name)
      if self.all.all? { |el| el.name != name }
        self.create(name)
      else
        self.find_by_name(name)    
      end
    end

  end # findable module 



end # concerns module 

