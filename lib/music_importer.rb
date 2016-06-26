class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*.mp3").collect {|file| file.split('/').last}.uniq
  end

  def import
    files.each {|fname| Song.create_from_filename(fname)}
  end
end