class MusicImporter
  attr_accessor :path, :files
  path = './spec/fixtures/mp3s'

  def initialize(path)
    @path = path
    @files
  end

  def files
  @@all = Dir.glob(path + "/*.mp3").collect{|files| files.split(/\mp3s\//)[1] }
  @@all
  end

  def import
    files.each{|files| Song.create_from_filename(files)}
  end
end
