require_relative './concerns/findable.rb'
require_relative './concerns/persistable.rb'
require_relative './concerns/nameable.rb'

class Genre
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  extend Nameable::ClassMethods
  attr_accessor :name, :songs

  def initialize (name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def artists
    songs.collect{|song|song.artist}.uniq
  end
end
