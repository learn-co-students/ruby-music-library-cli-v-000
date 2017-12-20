# Referenced Labs
# artist-song-modules-v-000
# ruby-advanced-class-methods-lab-v-000 || ruby-class-variables-and-class-methods-lab-v-000
# ruby-objects-has-many-lab-v-000 || ruby-objects-has-many-through-lab-v-000

require_relative '../lib/concerns/memorable.rb'
require_relative '../lib/concerns/findable.rb'

class Artist

  extend Memorable::ClassMethods
  extend Concerns::Findable
  include Memorable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    #puts "song.artist = #{song.artist}"
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    temp = []
    #puts "songs = #{@songs}"
    @songs.each { |song| temp << song.genre if temp.include?(song.genre) == false }
    temp
  end

end
