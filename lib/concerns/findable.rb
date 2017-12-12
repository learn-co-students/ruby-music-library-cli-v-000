module Concerns::Findable

  def find_by_name(name)
    self.all.find{|song| song.name == name }
  end

  def find_or_create_by_name(name)
    if find_by_name(name) == nil
      self.create(name)
    else
      find_by_name(name)
    end
  end
end


# Implement a generic #find_by_name method that uses the .all method defined by the class to find an instance of the class by name.
# Implement a generic #find_or_create_by_name method that uses the .all method defined by the class to find an instance of the class by name and to create a new instance if a match is not found.
# Add this module to your Genre and Artist class.
