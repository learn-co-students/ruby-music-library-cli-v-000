require 'pry'
class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    filenames = Dir.entries(@path)
    to_split = []
    filenames.each do |file_name|
      if file_name.include?(" - ")
        to_split << file_name
      end
    end
    @files = to_split
    @files
  end

  def import
    file_array = self.files
    file_array.each do |fn|
      song = Song.create_from_filename(fn)
    end
  end
end

#
# def initialize(path)
#   @path = path
#   @files = []
#   self.files
# end
#
# def files
#   filenames = Dir.entries(@path)
#   to_split = []
#   filenames.each do |file_name|
#     if file_name.include?(" - ")
#       to_split << file_name
#     end
#   end
#   @files = to_split
#   @files
# end
#
# def import
#   i=0
#   while i<@files.size
#     song = Song.new_by_filename(@files[i])
#     i+=1
#   end
# end



# class EmailParser
#   attr_reader :email_address
#
#   def initialize(emails)
#     @email_address = emails
#   end
#
#   def parse
#     result = []
#     splits = @email_address.split(' ')
#     splits.each_with_index do |email, i|
#       splits[i] = email.chomp(",")
#     end
#     splits.each do |email|
#       if !(result.include?(email))
#         result << email
#       end
#     end
#     result
#   end
# end

# def self.new_from_filename(filename)
#   separated = filename.split(" - ")
#   artist = separated[0]
#   song_name = separated[1].chomp(".mp3")
#   song = self.new
#   song.name = song_name
#   song.artist_name = artist
#   return song
# end
#
# def self.create_from_filename(filename)
#   separated = filename.split(" - ")
#   artist = separated[0]
#   song_name = separated[1].chomp(".mp3")
#   song = self.new
#   song.save
#   song.name = song_name
#   song.artist_name = artist
#   return song
# end
