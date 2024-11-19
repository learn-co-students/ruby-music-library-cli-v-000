# defines a module named Concerns::Findable
module Concerns::Findable
  
  def find_by_name(name)
    # searching the extended class's @@all variable for an instance that matches the provided name
    self.all.detect{|x| x.name == name}
  end
  
  def find_or_create_by_name(name)
    # finds (does not recreate) an existing instance with the provided name if one exists in @@all
    # invokes .find_by_name instead of re-coding the same functionality
    # invokes the extended class's .create method, passing in the provided name, if an existing match is not found
    self.find_by_name(name) || self.create(name)
  end
  
end