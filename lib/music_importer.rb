# class MusicImporter
#
#   @@all = []
#
#   def initialize(path)
#     @path = path
#     @@all << self
#   end
#
#   def path
#     @path
#   end
#
#   def files
#     Dir[@path + "/*"].map do |path|
#       path.gsub("#{@path}/","")
#     end
#   end
#
#   def import
#       files.each do |song|
#       # binding.pry
#       song = Song.create_from_filename(song)
#       # binding.pry
#     end
#
#
#   end
#
#   # ./spec/fixtures/mp3s"
#   # Dir[@path]
# # ruby find directory
# # binding.pry
#
#
#
# end
