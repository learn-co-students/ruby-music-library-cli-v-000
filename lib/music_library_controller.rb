class MusicLibraryController
  attr_accessor :path

  def initialize(path)
    @path = path
    new_MI_object = MusicImporter.new(path).import
  end

  # def files
  #   @files = Dir["#{path}/*.mp3"].collect {|f| f.gsub("#{path}/", "")}
  # end

  # def import
  #   files.each {|f| Song.create_from_filename(f)}
  # end

end
