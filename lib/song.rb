# require 'nokogiri'
# require 'open-uri'
# require 'pry'

# #require_relative './ .rb'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist
  @@all = []

    def initialize(name)
        @name = name
        #@@all << self
    end

    def artist
      @artist
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(name)
        self.new
        self.save
    end
end
