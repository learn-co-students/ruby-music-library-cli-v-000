# 1/8/19  MUST UPDATE from artist-song modules lab

require 'pry'

class Song
  extend Findable::ClassMethods
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  include Paramable::InstanceMethods

  attr_accessor :name
  attr_reader :artist

  @@all = []

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
  end
end
