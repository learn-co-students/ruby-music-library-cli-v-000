require 'pry'
class MusicImporter

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    Dir.entries(@path).collect do |val|
      if val.include?(".mp3")
        val
      end
    end.compact
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end
