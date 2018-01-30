require_relative './concerns/findable.rb'

class Artist

attr_accessor :name, :songs
@@all = []
extend Concerns::Findable


  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq

  end

  def songs
    @songs
  end


    def self.all
      @@all
    end

    def self.destroy_all
      self.all.clear
    end

    def self.create(name)
      new_instance = self.new(name)
      new_instance.save
      new_instance
    end











end
