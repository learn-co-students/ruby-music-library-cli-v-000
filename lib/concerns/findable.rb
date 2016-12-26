module Concerns::Findable
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    @@all << self
  end
  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end
end
