class MusicImporter

  attr_reader :path

  def initialize(path)
      @path = path
  end

  def files
     Dir.entries(@path).delete_if{|memo| memo =="." || memo ==".." }
  end

  def import
     files.each{ |obj| Song.create_from_filename(obj) }
  end


end
