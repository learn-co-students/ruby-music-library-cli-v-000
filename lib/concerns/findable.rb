module Concerns::Findable
  def find_by_name(instance_name)                       #find_by_name is added as a class method to classes that extend the module
    self.all.detect {|song| song.name == instance_name} #searches the extended class's @@all variable for an instance that matches the provided name
  end

  def find_or_create_by_name(instance_name)                         #find_or_create_by_name is added as a class method to classes that extend the module
    self.find_by_name(instance_name) || self.create(instance_name)  #finds (does not recreate) an existing instance with the provided name if one exists in @@all
  end                                                               #invokes the extended class's .create method, passing in the provided name, if an existing match is not found

  def sorted                                                        #class module method to sort collections alphabetically 
    self.all.sort_by {|object| object.name }
  end
end
