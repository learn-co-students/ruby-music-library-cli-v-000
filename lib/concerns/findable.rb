module Concerns::Findable

# class Person

#   attr_accessor :name
#    @@all = []

#   def initialize(name)
#     @name = name
#   end
#   def all
#     @@all
#   end

  def find_by_name(name)
   #binding.pry
     @@all.find{|a| a.name == name}
  end

  def find_or_create_by_name(name)
    @@all.find{|a| a.name == name} || self.new(name)

  end
end
