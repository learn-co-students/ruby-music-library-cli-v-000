module Concerns::Persistable
  def self.all
    self.all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.save
    self.all << self
  end
end
