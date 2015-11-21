class MusicImporter

  attr_accessor :files
  attr_reader :path

  def initialize(filepath)
    @path = filepath
    files
  end

  def files
    @files = Dir.entries(@path)
    @files.delete_if{|a| a.end_with?("mp3") == false}
    @files
  end

  def import
    @files.each do |file|
      Song.create_from_filename(file)
    end
  end

end