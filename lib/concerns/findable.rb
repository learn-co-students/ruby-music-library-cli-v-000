module Concerns::Findable

class Person

  @@all = []

  def find_by_name
    @@all.detect{|person| person.name == name}
  end


  def self.find_or_create_by_name(name)
    @@all.detect{|person| person.name == name} || Artist.new(name)

  end
end
end
