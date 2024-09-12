module Concerns::Findable

  def find_by_name(name)
    all.detect {|n| n.name == name}
  end


def create(name)
  artist = self.new(name)
  artist.save
  artist
end

def find_or_create_by_name(name)
  find_by_name(name) ? find_by_name(name) : create(name)
end

end
