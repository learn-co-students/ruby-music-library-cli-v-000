module Concerns

  module Findable

    def find_by_name(name)
      self.all.find {|object| object.name == name}
    end

    def find_or_create_by_name(name)
      temp_obj = self.all.find {|object| object.name == name}
      temp_obj ||= self.create(name)
    end
  end
  
end