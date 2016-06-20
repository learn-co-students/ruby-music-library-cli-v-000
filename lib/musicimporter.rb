class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(self.path).select {|file| file.end_with?(".mp3")}
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end

# require 'pry'
# class MusicImporter
#   #   extend Concerns::Findable
#   attr_accessor :path #, :files

#   def initialize(path)
#     @path = path
#   end

#   def files #return a list of files
#     @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
#    # @files = Dir['#{@path}/*'] #empty return
#    # Dir.entries(@path).find_all {|file| file.include?(".mp3")}
# #binding.pry
#   end


#   def import
#       self.files.each do |song|
# #binding.pry
#       Song.create_from_filename(song)

#      end
#    end
# end
