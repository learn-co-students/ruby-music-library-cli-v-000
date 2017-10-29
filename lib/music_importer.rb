class MusicImporter
  attr_reader :path

#accepts a file path to parse MP3 files from
  def initialize(path)
    @path = path
  end

#loads all the MP3 files in the path directory
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|file|
#normalize the filename to just the MP3 filename with no path
    file.gsub("#{path}/", "")}
  end

  def import
#imports the files into the library by invoking Song.create_from_filename on each file
    files.each{|file| Song.create_from_filename(file)}
  end

end
