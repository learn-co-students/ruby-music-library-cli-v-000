class Artist
  extend Concerns::Findable
  extend Concerns::Persistable
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name, :genre
  attr_reader :songs
  @@all = []

  def self.all
    @@all
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    genres = songs.collect {|song| song.genre}
    genres.uniq
  end

end
