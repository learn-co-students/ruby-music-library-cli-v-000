class MusicImporter
  attr_reader :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob(@path + "/*.mp3") #loads file names from directory, only mp3s
    @files.collect!{ |i| File.basename(i) } #formats file names, removes directories, and stores collected array back in @files with bang operator (!)
    @files.sort! #sorts files alphabetically
  end

  def import
    files.each { |i| Song.create_from_filename(i) } #calls files method above to collect and normalize file names, instantiates new Song object for each name in array
  end

end