module Concerns::Findable
  
  def find_by_name(name)
    all.detect {|a| a.name == name }
  end
  
  def find_or_create_by_name (name)
    song = find_by_name(name)
    if song == nil
      song.create(name)
    else
      song
    end
  end
  
end