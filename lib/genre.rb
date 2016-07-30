require 'pry'
class Genre

  attr_accessor :name, :songs, :artists

  extend Concerns::Findable
  extend Persistable::ClassMethods
  extend Memorable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  include Nameable::InstanceMethods

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end
end
