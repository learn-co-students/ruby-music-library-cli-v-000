class MusicImporter
  attr_accessor :path
  attr_reader :files

  def initialize (path)
    @path = path
    update_files
  end

  def update_files
    # get all directory entries in the path and then filter for .mp3
    @files = Dir::entries(@path).select { | file_name | file_name.match(".mp3") }
  end

  def import
    @files.each { | filename | Song.create_from_filename(filename)}
  end
end
