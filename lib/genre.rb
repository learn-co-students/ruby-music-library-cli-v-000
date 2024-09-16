
class Genre
   extend Concerns::Findable
   @@all = []
  attr_accessor :name, :songs
  def initialize(name)
    @name = name
    @songs= []
    self.save

  end
  def self.create(name)
    Genre.new(name)
  end

  def save
    @@all << self
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  #Relationships
      def add_song(song)
            if song.genre == nil
               song.artist= self
            end
            if !@songs.include?(song)
                @songs << song
            end
      end
      def artists
          @songs.map { |e| e.artist}.uniq
      end
end
