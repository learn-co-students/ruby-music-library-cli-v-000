class Song
  attr_accrssor :name
  @@all = []
  def initialize (name)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.class.all.clear
  end

  def self.save
    self.class.all <<
  end
end
