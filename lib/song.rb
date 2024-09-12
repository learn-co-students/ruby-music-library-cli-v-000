class Song

	attr_accessor :name, :artist, :genre

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		if artist != nil
			self.artist=(artist)
		end
		if genre != nil
			self.genre=(genre)
		end
	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end

	def self.destroy_all
		@@all.clear
	end

	def self.create(name)
		instance = self.new(name)
		instance.save
		instance
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self)
	end

  def self.find_by_name(name)
    @@all.detect do |x|
      x.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
        self.find_by_name(name)
    else
        self.create(name)
    end
  end

  def self.new_from_filename(file_name)
    art = Artist.find_or_create_by_name(file_name.split(' - ')[0])
    genre = Genre.find_or_create_by_name(file_name.split(' - ')[2].gsub('.mp3',''))
    if find_by_name(file_name.split(' - ')[1]) == nil
      Song.new(file_name.split(' - ')[1], art, genre)
    end
  end

  def self.create_from_filename(file_name)
    x = new_from_filename(file_name)
    x.save
  end

end
