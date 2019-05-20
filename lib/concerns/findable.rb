module Concerns::Findable
  #to activate  module in a class, make sure to require_relative './filepath.rb'
  #this uses class methods, therefor when adding the to the class you use extend
  #if instance methods than include is used


  #!!!!CLASS METHODS DO NOT REQUIRE SELF IN THE METHOD TITLE IN MODULES
        def find_by_name(name)
          self.all.detect {|song| song.name == name}
        end
        def find_or_create_by_name(name)
          self.find_by_name(name) || self.create(name)
        end

end
