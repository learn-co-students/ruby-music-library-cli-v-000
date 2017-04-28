class MusicImporter

  attr_reader :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    array = Dir.entries(path)
    mp3files = array.select {|file_name| file_name.split(".")[-1] == "mp3"}
    @files = mp3files.collect {|file_name| file_name.gsub("#{path}/", "")}
    # OR this   @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def files_without_extension
    self.files.collect {|f| f.gsub(".mp3","")}
  end

  def import
      if Dir.exists?(path)
        self.files.collect {|file_name| Song.create_from_filename(file_name)}
      end
  end
end
