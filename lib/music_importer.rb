class MusicImporter
  attr_accessor :path, :files, :song

  def initialize(path)
    @path = path
  end

  def files
    @files ||=Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "")}
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
