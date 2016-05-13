module Concerns::Findable


def self.find_by_name(name)
  self.all.detect { |song| song.name == name}
end

def self.find_or_create_by_name(name)
  self.all.detect { |song| song.name == name} || self.create(name)  
end

end

