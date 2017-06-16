require 'pry'

class Song
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  # describe '.create' do
  #   it 'initializes and saves the song' do
  #     song = Song.create("In the Aeroplane Over the Sea")
  #
  #     expect(Song.all).to include(song)
  #   end
  # end
end
