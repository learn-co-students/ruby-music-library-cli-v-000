class MusicImporter
  attr_accessor :path, :files
  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.entries(@path).reject {|f| File.directory?(f) || f[0].include?('.')}.each do |file|
      @files << file
    end
  end

  def import
    self.files
    @files.each do |file|
      filename = file.split(" - ")
      name = filename[1]
      artist = Artist.find_or_create_by_name(filename[0])
      genre = Genre.find_or_create_by_name(filename[2])
      song = Song.new(name, artist, genre)
      artist.add_song(song)
      genre.add_song(song)
      song
    end
  end
end
