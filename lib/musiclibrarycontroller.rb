# class MusicLibraryController
  
#   attr_accessor :path

#   def initialize(path = './db/mp3s')
#     @path = path
#     musicimporter =  MusicImporter.new(path)
#     musicimporter.import
#   end 
  
#   def call
#     p 'Welcome to your music library!'
#     answer = ''
#       while answer != gets.chomp
#         loop { puts '"To list all of your songs, enter 'list songs''}
#         break if 
        
#       end  
#   end
# end