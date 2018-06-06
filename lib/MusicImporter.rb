class MusicImporter

attr_accessor :path, :filename, :artist, :name

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["#{@path}/*.mp3"]
    files.collect {|file| file.split("/")[-1]}
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
