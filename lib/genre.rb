class Genre
  extend Memorable::ClassMethods, Concerns::Findable
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

  def songs
    @songs
  end

  def add_song(song)
    @songs<<song if !@songs.include?(song)
  end

  def atrists
    @songs.collect{|song| song.artist}.uniq
  end

end
