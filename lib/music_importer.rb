class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*.mp3").collect { |file| file.gsub("#{@path}/", "") }
  end

  def import
    self.files.each do |song|
      Song.create_from_filename(song)
    end
  end
end
