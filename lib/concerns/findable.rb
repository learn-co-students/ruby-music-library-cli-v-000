module Concerns

  module Findable

    def find_by_name(name)
      if all.size == 0
        return nil
      end  
      # all.each do |a|
      #   if a.name == name
      #     binding.pry 
      #     return a
      #   else return nil
      #   end
      # end
      found = all.index{|a| a.name == name}
      if found != nil 
        all[found]
      else 
        nil
      end
    end

    def find_or_create_by_name(name)
      exist = find_by_name(name)
      if exist == nil
        self.create(name)
      else
        exist
      end
    end
  end

end