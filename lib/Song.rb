class Song
    attr_accessor :name
    attr_reader :artist
    attr_reader :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
       @name = name
       self.artist = artist unless artist.nil?
       self.genre = genre unless genre.nil?
    end

    def create
       Song.new(name).tap(&:save)
    end

    def save
       @@all.push(self)
    end

    def artist=(artist)
       @artist = artist
       artist.add_song(self)
    end

    def genre=(genre)
       @genre = genre
       genre.songs.push(self) unless genre.songs.include?(self)
    end

    def self.new_from_filename(file_name)
     artist = Artist.find_or_create_by_name(file_name.split(' - ')[0])
       name = file_name.split(' - ')[1]
       genre = Genre.find_or_create_by_name(file_name.split(' - ')[2].chomp('.mp3'))

       Song.new(name, artist, genre)
    end

    def self.create_from_filename(file_name)
       Song.new_from_filename(file_name).tap(&:save)
    end

    def self.find_by_name(name)
       all.detect { |song| song.name == name }
    end

    def self.find_or_create_by_name(name)
       find_by_name(name) || create(name)
    end

    def self.create(name)
       Song.new(name).tap(&:save)
    end

    def self.all
       @@all
    end

    def self.destroy_all
       @@all.clear
    end

    def self.sort_all_by_name
       all.sort_by!(&:name)
    end
 end
