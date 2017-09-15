class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    music_path = Dir.open(self.path)
    @song_array = music_path.sort.collect do |songs|
      songs
    end
    2.times do
      @song_array.shift
    end
    @song_array
  end

  def import
    files.each do |songs|
    Song.create_from_filename(songs)
    end
  end


end
