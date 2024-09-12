module Concerns
  module Findable
    def create(objectName)
      object = self.new(objectName)
      object.save
      object
    end

     def find_by_name(objectName)
      self.all.find {|object| object.name == objectName }
    end

     def find_or_create_by_name(objectName)
      self.find_by_name(objectName) ? self.find_by_name(objectName) : self.create(objectName)
    end
  end
end
