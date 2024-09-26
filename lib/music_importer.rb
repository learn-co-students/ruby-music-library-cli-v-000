class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").map{ |file| file.gsub("#{path}/", "") } #Dir.glob allows you to pattern match for specific files in a directory.
  end #||= "If @files is falsey, evaluate Dir.glob(blah blah blah) and set it equal to @files"

  def import
    files.each { |file| Song.create_from_filename(file) }
  end



end
