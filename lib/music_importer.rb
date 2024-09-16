class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
      Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")} #Dir.glob method lets you look for certain files within the working directory.
    end

    def import #imports the files into the library by invoking Song.create_from_filename
      files.each {|file| Song.create_from_filename(file) }
    end

end
