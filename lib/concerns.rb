require './config/environment.rb'
module Concerns
  
  module Findable
    
    def destroy_all
      self.all.clear
    end
    
    def find_by_name(name)
      self.all.detect{|item| item.name == name}
    end
    
    def find_or_create_by_name(name)
      if self.find_by_name(name)
        item = self.find_by_name(name)
      else
        item = self.create(name)
      end
      item
    end
    
    def create(name, attr1 = nil, attr2 = nil)
      if self.class == Song
        new = self.new(name, attr1, attr2)
      else
        new = self.new(name)
      end
      new.save
      new
    end
    
    def get_name(name)
      self.find_by_name(name)
    end
    
    def sort_by_name
      self.all.sort_by{|item| item.name}
    end
    
    def put_list
      list = self.sort_by_name
      if self == Song
        list.each_with_index{|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
        else
          list.each_with_index{|item, i| puts "#{i + 1}. #{item.name}"}
        end
    end
    
  end
  
  module Instance
    
    def save
      self.class.all << self
    end
    
    def sort_by_name
      self.songs.sort_by{|item| item.name}
    end
    
    def put_list
      list = self.sort_by_name
      if self.class == Artist
        list.each_with_index{|song, i| puts "#{i + 1}. #{song.name} - #{song.genre.name}"}
      else
        list.each_with_index{|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name}"}
      end
    end
    
  end
  
  module MLInit
    
  end
end