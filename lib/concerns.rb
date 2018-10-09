module Concerns::Findable
  module ClassMethods
  def self.find_by_name(song)
    found_array = @@all.detect {|x| x.name == song}
    found_array
  end

  def self.find_or_create_by_name(song)
    find_by_name(song) || self.create(song)
  end
end

end
