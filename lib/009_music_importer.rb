class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*mp3")
    @files =@files.collect{|x| x.gsub("#{path}/", "")}
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
