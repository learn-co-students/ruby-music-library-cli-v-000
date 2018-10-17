class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.entries(path).select{|mp3| mp3.end_with?(".mp3")}
  end

  def import
    files.each {|name| Song.create_from_filename(name)}
  end
end
