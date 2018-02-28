class Song
  # extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

end
#
# class Artist
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
#
# end
#
#
# class Genre
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
#
# end
