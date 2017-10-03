def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob(path + '/**/*.mp3').collect{|filename| filename.gsub("#{path}/", "")}
  end

  def import
    files.each { |filename| Song.create_from_filename(filename)}
  end
