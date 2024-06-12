class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    #come cercare tutti file nella directory ed esporli
    binding.pry
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    # @files ||= Dir.glob("#{path}/*.mp3").select{ |f| File.file?(f) }.map{ |f| File.basename f } #or simply f
    # @files ||= Dir.each_child(path).map {|file| file} # or `File.basename file`
    # @files ||= Dir.entries(path) - %w[. ..]

  end


  def import
    self.files.each{|filename| Song.create_from_filename(filename) }
  end
end
