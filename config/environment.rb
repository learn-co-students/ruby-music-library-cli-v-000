require 'bundler'
Bundler.require

module Concerns
  module Findable 
     
     def find_by_name(name_string)
  self.all.detect {|song| song.name == name_string} 
 end 
 
 def find_or_create_by_name(name_string)
   find_by_name(name_string) || create(name_string)
 end 
   
  end 

end

require_all 'lib'
