class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre

    # Or, as a one-liner:
    # new(name).tap{ |g| g.save }
  end

  def artists
    songs.collect{ |s| s.artist }.uniq
  end
end
# class Genre
#     extend Findable # Take all of the methods in the Findable module and add them as class methods
#     extend Persistable::ClassMethods
#     extend Nameable::ClassMethods
#     include Persistable::Instance Methods
#
#     attr_accessor :name, :songs
#
#     @@all = []
#
#     def self.all # Class Reader
#         @@all
#     end
#
#     def initialize
#         save
#         @songs = []
#     end
#
#     # Genres have Artists through Songs. "Has-Many-Through"
#     def artists
#         @songs.collect {|s| s.artist}.uniq
#     end
#
#
# end
