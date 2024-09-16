class MusicImporter

  attr_accessor :path, :mp3_files

  def initialize(path)
    @path = path
  end

  def files
    @mp3_files = Dir.glob("#{self.path}/*mp3") #sets files array to equal the files with mo3
    @mp3_files = @mp3_files.collect{|x| x.gsub("#{path}/", "")}
  end

  def import
    files.each {|song| Song.create_from_filename(song)}
  end

end
