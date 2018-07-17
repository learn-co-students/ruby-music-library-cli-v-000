class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    directory = Dir.glob("#{path}/*mp3")
    new_dir = []
    directory.each do |file|
      song = self.normalize(file)
      new_dir << song
    end
    new_dir
  end

  def normalize(file)
    song = file.split(" - ")
    song[0] = song[0].split("/")
    song[0] = song[0][4]
    song = song.join(" - ")
    song
  end

  def import
      new_files = self.files
      new_files.each do |file|
        new_song = Song.create_from_filename(file)
      end
  end

end
