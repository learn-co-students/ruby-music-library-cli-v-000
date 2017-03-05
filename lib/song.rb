require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    # binding.pry
    if artist != nil
      artist.add_song(self)
    end
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name).tap{|song| song.save}
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  # def self.find_by_name(name)
  #   @@all.find {|song| song if song.name == name} #checks all for song's name using the string argument, and returns that object - used for find_or_create_by_name
  # end

  # def self.find_or_create_by_name(name)
  #   if Song.find_by_name(name)
  #     Song.find_by_name(name)
  #   else
  #     Song.create(name)
  #   end
  # end

end
