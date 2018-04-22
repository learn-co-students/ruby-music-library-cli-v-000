class MusicImporter
  attr_reader :path, :files

  def initialize(file_path)
    @path = file_path
  end

  def files
    @files = Dir.entries(@path)
    @files.grep(/\.mp3$/)
  end

  def import
    files.each do |file|
    song = Song.create_from_filename(file)
    end
  end
end
