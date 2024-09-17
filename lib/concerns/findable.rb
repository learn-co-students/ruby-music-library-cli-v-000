# Concerns::Findable
# defines a module named Concerns::Findable (FAILED - 1)

# Artist
# extends the Concerns::Findable module (FAILED - 2)

# Genre
# extends the Concerns::Findable module (FAILED - 3)

# Concerns::Findable
# .find_by_name
#   is added as a class method to classes that extend the module (FAILED - 4)
#   isn't hard-coded (FAILED - 5)
#   works exactly like a generic version of Song.find_by_name,
#     searching the extended class's @@all variable for an instance that matches the provided name (FAILED - 6)
# .find_or_create_by_name
#   is added as a class method to classes that extend the module (FAILED - 7)
#   works exactly like a generic version of Song.find_or_create_by_name:
#     finds (does not recreate) an existing instance with the provided name if one exists in @@all (FAILED - 8)
#     isn't hard-coded (FAILED - 9)
#     invokes .find_by_name instead of re-coding the same functionality (FAILED - 10)
#     invokes the extended class's .create method, passing in the provided name, if an existing match is not found (FAILED - 11)


module Concerns::Findable
  def find_by_name(name)
    self.all.find{|el| el.name == name}
  end

  def find_or_create_by_name(name)
    result = find_by_name(name)

    if result == nil
      create(name)
    else 
      result
    end
  end
end 