require 'pry'
require 'rspec'
require 'require_all'

class Song
  extend Concerns::Findable

  attr_accessor :name
  @@all = []


end
