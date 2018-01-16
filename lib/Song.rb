require 'pry'
class Song
    extend Concerns::Findable 
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods
    attr_accessor :name, :artist, :genre
    

    def initialize(name, artist= nil, genre= nil)
        self.name = name 
        self.artist = artist if artist != nil 
        self.genre = genre if genre != nil 
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def genre
        @genre
    end

    def self.new_from_filename(filename)
        data = filename.split(/ - /)
        artist= Artist.find_or_create_by_name(data[0])
        genre = Genre.find_or_create_by_name(data[2].gsub('.mp3', ''))
        Song.new(data[1], artist, genre) unless self.find_by_name(data[1])
    end

    def self.create_from_filename(filename)
        new_from_filename(filename).save
    end

end 