class MusicImporter

  def initialize(path)
    @path = path
  end

  def path#path retrieves the path provided to the MusicImporter object
    dir  = File.dirname(pn)     # "/usr/bin"
  #./spec/fixtures/mp3s
  end

  def files

  end

  def import
    files.each {|file| Song.new_from_filename(file)}
  end
end
