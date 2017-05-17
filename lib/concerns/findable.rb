module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect{|a| a.name == name}
    end

    # def find_or_create_by_name(name_to_find)
    #     found = nil
    #     all.each do |obj|
    #         found = obj if obj.name == name_to_find
    #       end
    #     if found == nil
    #       found = self.new(name_to_find)
    #       found.save
    #     end
    #     found
    # end

    def find_or_create_by_name(name_to_find)
      found = self.find_by_name(name_to_find)
      if found == nil
        found = self.new(name_to_find)
        found.save
      end
      found
    end


  end
end
