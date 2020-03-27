module Concerns
  module Findable
    def find_by_name(obj_name)
      self.all.find {|i| i.name == obj_name }
    end

    def find_or_create_by_name(obj_name)
      self.find_by_name(obj_name).nil? ? self.create(obj_name) : self.find_by_name(obj_name)
    end
  end
end
