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
    self.files.each do |stringthing|
      Song.create_from_filename(stringthing)
    end
  end


end
