class MusicImporter

  attr_reader :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir["#{@path}/*.mp3"]
    @files.each {|file| file.slice!("#{@path}/")}
    #binding.pry
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end
