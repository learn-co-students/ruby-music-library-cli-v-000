class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select do |entry|
      entry.split("").last(3).join == "mp3"
    end
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end