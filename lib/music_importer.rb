class MusicImporter
# attributes, variables, modules
attr_accessor :path, :files

# initialize
  def initialize(path)
    @path = path
  end

# instance methods
  def files
    @files = Dir.glob("#{self.path}/*.mp3").collect{|filename| filename.gsub("#{path}/", "")}
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end

end
