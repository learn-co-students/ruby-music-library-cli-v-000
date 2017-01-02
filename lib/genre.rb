class Genre
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  include Concerns::Findable::InstanceMethods
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    save
    @songs = []
  end

    def self.all
      @@all
    end

    def self.create(name)
      Genre.new(name)
    end

    def add_song(song)
      @songs << song
      song.genre = self unless song.genre != nil
    end

    def artists
      @songs.collect {|song| song.artist}.uniq
    end

end
