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
     self.all.detect{|a| a.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name) #unless self.all.include?(name)
  #  self.all.find_by_name {|a| a.name == name} || self.create(name)
    #Cannot use self.all.find_by_name
  end
end
