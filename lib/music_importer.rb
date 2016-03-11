class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
     tracks = Dir.entries(path).find_all{|files| files =~ /mp3$/}
  end

  def import
    #binding.pry
   files.each{|f| Song.create_from_filename(f)}
    #files.each{|filename| puts filename}
  end
end