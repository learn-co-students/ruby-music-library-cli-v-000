require 'pry'

class Artist
	extend Concerns::Findable
	attr_accessor :name, :songs
	@@all = []


	def self.all # Class reader
		@@all
	end

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		@@all << self
	end



	def self.create(name)
		artist = self.new(name)
		artist.save
		artist
	end

   #can also do the following:
    #new(name).tap{|artist| artist.save}

    #What is #tap for?
    #It just allows you do do something with an object inside of a block, and always have that block return the object itself. #tap was created for tapping into method chains, so code like this:

    #def something
      #result = operation
      #do_something_with result
      #result # return
    #end

    # TRADITIONAL
    #object = Model.new
    #object.save!
    #object

    # TAPPED
    #object = Model.new.tap do |model|
      #model.save!
    #end

    # CONDENSED
    #object = Model.new.tap(&:save!)
      #end

	def add_song(song)
		song.artist = self unless song.artist == self
		@songs << song unless songs.include?(song)
	end

	def self.destroy_all
		@@all.clear
	end

	def genres
		self.songs.collect{|s| s.genre}.uniq
	end
end

