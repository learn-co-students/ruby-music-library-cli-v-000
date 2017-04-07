module Concerns::Findable

  def find_by_name(name)
    self.all.detect do |i|
      i.name == name
    end
    # finds an instance in @@all by the name property of the artist and/or genre
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  # finds or creates an artist and/or genre by name maintaining uniqueness of objects by their name property
end
