module Concerns::Findable

  def create(name)
    song = Song.new(name)
    song.save
    song
  end

  def find_by_name(name)
    all.detect{|a| a.name == name}
   end

   def find_or_create_by_name(name)
    find_by_name(name) || create(name)
    end
  end
