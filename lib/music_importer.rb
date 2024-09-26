class MusicImporter

  attr_accessor :path

  @@all = []

  def initialize(path)
    @path = path
    @@all << path
  end

  def files
    files = Array.new
    path = Dir.open(@path)

    path.each do |extension|
      if extension.include?('.mp3')
        files << extension
      end
    end
    files
  end

def import
    self.files.each do |file|
      file = file.split(' - ')
      song_name = file[1]
      artist = Artist.find_or_create_by_name(file[0])
      genre = Genre.find_or_create_by_name(file[2].split('.')[0])
      Song.create(song_name, artist, genre)
    end
  end

end