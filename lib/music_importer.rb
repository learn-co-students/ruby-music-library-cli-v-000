class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    items = Dir.entries(@path)
    @files = items.select{|file| file.include?(".mp3")}.sort
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end

  end

end
