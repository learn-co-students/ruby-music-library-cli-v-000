class MusicImporter
  attr_accessor :path, :songs
  attr_writer :files

  def initialize(file_path)
    @path = file_path
    @files = Dir["#{file_path}/*.mp3"]
    @songs = []
  end

  def files
    @files = @files.collect do |file|
      file.split("/").last
    end
  end

  def import
    #imports files into the library by adding songs by filename
    self.files
    @files.each do |file|
      song = Song.create_from_filename(file)
      @songs << song
      song
    end
  end
end
