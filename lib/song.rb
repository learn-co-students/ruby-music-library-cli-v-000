# use 'git checkout -- ./' command to refresh directories 
# in case of problems.  Then run 'bundle install'

require 'pry'

class Song
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist unless artist == nil
    @genre = genre unless genre == nil
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
    song = Song.new(name)
    song.save
    song
  end
  
  def artist=(artist)
     self.artist = Artist.find_or_create_by_name(artist)
#     binding.pry
     artist.add_song(self) unless artist.songs.include?(self)
  end
end

  # it "initializes and saves the song" do
  #     created_song = Song.create("Kaohsiung Christmas")

  #     expect(Song.all).to include(created_song)  
  
  
  # attr_reader :artist # belongs to artist
  
  # def artist=(artist) # Belongs to artist
  #   raise AssociationTypeMismatchError, "#{author.class} received, Author expected." if !author.is_a?(Author)
  #   @artist = artist
  #   artist.add_song(self) unless artist.songs.include?(self)
  # end

  # attr_reader :category # Belongs to category

  # def category=(category) # Belongs to category
  #   raise AssociationTypeMismatchError, "#{category.class} received, Category expected." if !category.is_a?(Category)
  #   @category = category
  #   category.add_story(self) unless category.stories.include?(self)
  # end

  