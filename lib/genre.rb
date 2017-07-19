class Genre
#  extend Findable # take all of the methods in the findable module and add them as class [extend] methods.
  extend Concerns::Findable #=> This is the module this lab's tests are looking for
  extend Persistable::ClassMethods
#  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name, :artist, :song # has many songs
# @@all = [] #=> we're able to get rid of this with the <<def self.extended(base)>> method in persistable.rb
  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end
# this is going into the persistable.rb file
# def save
#   @@all << self
# end

  def self.create(name)
    g = new(name) #=> This is a bizzaro thingy wherein this line of code is activating the "initalize" method above.
    g.save
    g
  end

  def self.all # This is s.thing special called a "Class Reader"
    @@all
  end

# this is going into the persistable.rb file
#  def self.destroy_all
#    @@all.clear
#  end
  def artists # it looks like a reader but it's more complicated
    # a has many through
    @songs.collect{|song| song.artist}.uniq #=> This is called a <<has-many-through>>
  end
end
