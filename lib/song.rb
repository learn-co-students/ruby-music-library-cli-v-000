# require 'nokogiri'
# require 'open-uri'
# require 'pry'

# #require_relative './ .rb'

class Song

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

    def destroy_all
        @@all = []
    end

    def self.create
        self.new
        self.save
    end
end
