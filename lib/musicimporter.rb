class MusicImporter
  attr_accessor :path

  # Initialize #
  def initialize(path)
    @path = path
  end

  # Instance Methods #
  def files
    Dir.entries(@path).keep_if {|song| song.include?(".mp3")}.map { |mp3| File.basename(mp3)}
  end

  def import
    files.map { |filename| Song.create_from_filename(filename) }
  end
end
