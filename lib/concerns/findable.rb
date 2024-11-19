module Concerns::Findable

  def find_by_name(name)
    # all.detect { |song| song.name == name }
    all.find { |song| song.name == name }
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
    # self.create(name)
  end

end


#   Implement a generic #find_by_name method that uses the .all method defined by the class to find an instance of the class by name.

# Implement a generic #find_or_create_by_name method that uses the .all method defined by the class to find an instance of the class by name and to create a new instance if a match is not found.
# Add this module to your Genre and Artist class.
# end
