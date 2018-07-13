class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select do |entry|
      entry.split("").last(3).join == "mp3"
    end
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end

# class MusicImporter
#
# 	attr_accessor :path
#
# 	def initialize(path)
# 		@path = path
# 	end
#
# 	def files
# 		@files = Dir["#{@path}/*"] #returns files in a path
# 		@files.map do |f|
# 			f.split("/")[-1]
# 		end
# 	end
#
# 	def import
# 		files.each do |f|
# 			Song.create_from_filename(f)
# 		end
# 	end
# end
