class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @file_list = Dir.glob("#{@path.gsub(/\A\W+/, "")}/*.mp3").collect { |i| i.gsub(/(\A.+[\/])/, "")}
  end

  def import #imports all files from the library, instantiating a new song object for each
    files.each { |i| Song.create_from_filename(i)}
  end

end
