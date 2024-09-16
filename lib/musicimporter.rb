class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files #convert path to list of mp3
    # Dir.entries(@path).grep(/mp3/) #regex unix reference. Concise.
    Dir.entries(@path).select { |file| file.include?("mp3") } #verbose but more intuitive to english/non-unix lingo
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end


end
