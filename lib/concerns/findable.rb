module Concerns::Findable #defines a module named Concerns::Findable

  def find_by_name(name)
    #works exactly like a generic version of Song.find_by_name, searching the extended class's @@all variable for an instance that matches the provided name
    all.detect { |class_instance| class_instance.name == name }
  end

    # def self.all
    #   @@all
    # end

  def find_or_create_by_name(name)
    # works exactly like a generic version of Song.find_or_create_by_name: #returns (does not recreate) an existing song with the provided name if one exists in @@all, invokes .find_by_name instead of re-coding the same functionality, creates a song if an existing match is not found, invokes .create instead of re-coding the same functionality
    find_by_name(name) || create(name)
  end
end
