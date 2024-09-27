class MusicImporter

attr_accessor :path

@@files = []

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*.mp3").collect {|file_name| file_name.gsub("#{@path}/", "")}
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
