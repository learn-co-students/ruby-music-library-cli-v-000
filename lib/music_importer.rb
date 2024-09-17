class MusicImporter

  attr_reader :files, :path


  def initialize(file_path = "../db/mp3s")
    @path = file_path
    @songs = []
    files = Dir["#{@path}/*"].select {|e| File.file?(e)}
    @files = files.collect {|name| name.split("/").last}
  end

  def import
    @files.each {|f| @songs << Song.create_from_filename(f)}
  end


end
