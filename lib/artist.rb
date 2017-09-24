require 'pry'
require_relative 'concerns/findable.rb'

class Artist
	extend Concerns::Findable

	attr_accessor :name, :songs, :genres

	@@all = []

	def initialize(name)
	@name = name
	@songs = []
	end

	def songs
		@songs
	end

	def self.create(name)
		new(name).tap {|s| s.save}
	end

	def genres
		self.songs.collect {|a| a.genre}.uniq
	end

	def add_song(song)
		song.artist = self unless song.artist == self
		@songs << song unless @songs.include?(song)
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def self.create_by_name(name)
		new(name).tap {|s| s.save}
	end

	def save
		@@all << self
	end

end