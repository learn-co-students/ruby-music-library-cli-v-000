class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
  @files =  Dir["#{@path}/*.mp3"].each {|file| file.slice!("#{@path}/")}
end

def import
  self.files.each do |file|
    Song.create_from_filename(file)
  end
end
end
