module Concerns::Findable

  def self.find_by_name(name)
    @@all.detect {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end