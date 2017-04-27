class MusicImporter

  attr_reader :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    array = Dir.entries(path)
    @files = array.select {|file_name| file_name.split(".")[-1] == "mp3"}
    # OR this   @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
      if Dir.exists?(path)
        self.files.each {|file_name| Song.create_from_filename(file_name)}
      end
  end
end
