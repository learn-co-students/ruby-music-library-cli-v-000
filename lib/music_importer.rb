class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.chdir(@path) do | path |
      Dir.glob("*.mp3")
    end
  end 

  def import
    files.each{|file_name| Song.create_from_filename(file_name) }
  end
end