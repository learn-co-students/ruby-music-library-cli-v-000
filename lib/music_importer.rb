class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    songs = Dir.glob("#{path}/*")
    normalized_songs = songs.map do |song|
      song.scan(/[A-Z].*/)
    end
    normalized_songs.flatten
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
  end

end