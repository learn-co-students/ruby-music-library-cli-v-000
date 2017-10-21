class MusicImporter
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    Dir.entries("#{path}").select{|filename| filename.include?("mp3")}
  end

  def import
    files.each do |song|
      Song.create_from_filename(song)
    end
  end

end
