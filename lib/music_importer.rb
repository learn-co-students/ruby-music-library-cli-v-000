class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files_array ||= Dir.glob("#{@path}/*.mp3").collect do |filename|
      filename.rpartition("/").last
    end
  end

  def import
    self.files.each do |f|
      song = Song.create_from_filename(f)
    end 
  end
end
