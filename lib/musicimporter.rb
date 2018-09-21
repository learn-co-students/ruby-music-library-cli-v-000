class MusicImporter

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
      @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
      # binding.pry
  end
  # ||= means if the first entry is truthy, return that, or set it equal to what is on the right hand side.

  def import
    # @files.each do |song|
  end

end
