module Concerns::AllClass
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end

module Concerns::AllInstance
  def save
    @@all << self
  end
end
