class Music
  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
      self.all.clear
  end

  def self.create(name)
    s = self.new(name)
    s
  end

  def initialize(name)
    @name = name
    save
  end

  def save
=begin
    if self.class.all.include?(self)
      return nil
    end

    self.class.all << self
  end
=end
  if self.all.include?(self)
    return nil
  end

  self.all << self
end
end
