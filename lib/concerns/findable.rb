module Concerns::Findable                     # defines a module named Concerns::Findable

    def find_by_name(name)                    # is added as a class method to classes that extend the module / isn't hard-coded
      all.detect{ |s| s.name == name }        # searching the extended class's @@all variable for an instance that matches the provided name
    end
    def find_or_create_by_name(name)          # is added as a class method to classes that extend the module
      find_by_name(name) || create(name)      # finds (does not recreate) an existing instance with the provided name if one exists in @@all / isn't hard-coded / invokes .find_by_name instead of re-coding the same functionality / invokes the extended class's .create method, passing in the provided name, if an existing match is not found
    end
end
