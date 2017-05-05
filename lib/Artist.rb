class Artist
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods


  attr_reader :songs, :genres, :name

  @@all = []

  def self.all
    @@all
  end



#==========InstanceMethods=======================================

  def initialize (name)
    super
    @songs=[]
  end


  def add_song(song)
      if !self.songs.detect{|obj|obj.name == song.name}
          self.songs << song
          song.artist = self
          self.songs.uniq
      end

  end

  def genres
    @songs.collect{|obj| obj.genre}.uniq
  end




end
