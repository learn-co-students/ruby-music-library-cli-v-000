class MusicImporter
  # attribute accessors
  attr_accessor :path

  # constructors
  def initialize(file_path)
    @path = file_path
  end

  # class methods
  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

  # instance methods
  def files
    all_entries = Dir.entries(@path)
    all_entries.select do |entry|
      entry.end_with?('.mp3')
    end
  end
end
