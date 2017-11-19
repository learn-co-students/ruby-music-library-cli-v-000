class Artist
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  attr_accessor :name
  @@all=[]


  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.all
    @@all
  end

  def self.create(name)
    self.new(name).save
    self
  end

  def add_song(song)
    song.artist=self if song.artist==""
    @songs<<song if !@songs.include?(song)
    #@songs.detect {|s|  s.name== song}.artist=self
  end

  def songs
    @songs
  end


end
