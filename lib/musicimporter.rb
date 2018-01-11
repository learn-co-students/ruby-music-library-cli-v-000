class MusicImporter
 attr_accessor :path
 def initialize(path)
   @path = path
  end
  
  def files
    Dir["#{@path}/**/*.mp3"].collect do |file|
      file.gsub!("#{@path}/", "")
    end
  end

  def import
    files_array = self.files
    files_array.each do |file_name|
    Song.create_from_filename(file_name)
  end
  end
end