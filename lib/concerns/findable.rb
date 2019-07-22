module Concerns
  module Findable
  # Module code here
    def find_by_name(name)
      all.detect { |song| song.name == name }
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else self.create(name)
      end
    end
  end
end

# Implement a generic #find_by_name method that uses the .all method defined by the class to find an
# instance of the class by name.
# Implement a generic #find_or_create_by_name method that uses the .all method defined by the
# class to find an instance of the class by name and to create a new instance if a match is not found.
