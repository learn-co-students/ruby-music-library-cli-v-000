class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    all_files = []
    Dir.entries(@path).each do |entry|
      if File.fnmatch('*.mp3', entry)
        all_files << entry
      end
    end
    all_files
  end

  def import
    all_files = self.files    
    all_files.each do |file|
       songs_created = Song.new_from_filename(file)
       songs_created.save
    end  
  end

end