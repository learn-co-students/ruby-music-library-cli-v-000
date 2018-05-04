class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def path
    @path
  end

  def files
    @files = Dir.glob("#{path}/*.mp3").collect{ |file| file.gsub("#{path}/", "") }
  end

  def import
    self.files.each{|file| Song.create_from_filename(file)}
  end

  # def import
  #   @songs.each do |song|
  #     Song.create_from_filename(song)
  #   end
  # end


end
