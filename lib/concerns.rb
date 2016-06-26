module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect {|object| object.name == name}
    end

     def find_or_create_by_name(object)
      if self.find_by_name(object) == nil
         new_object = self.new(object)
         new_object.save
         new_object
      else
        self.find_by_name(object)
    end
     end
  end
end