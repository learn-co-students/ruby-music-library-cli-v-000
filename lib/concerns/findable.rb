
module Concerns::Findable

def find_by_name(name)
	self.all.detect{|o| o.name == name}
end

def create(name)
	artist = new(name)
    artist.save
    artist
end

def find_or_create_by_name(name)
	find_by_name(name) || create(name)
end

end
