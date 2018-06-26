require './config/environment.rb'
require 'pry'
class Genre 
 
 extend Concerns::Findable
  include Concerns::Instance
 
  attr_accessor :name, :genre, :songs
 
  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def self.all 
    @@all
  end

end