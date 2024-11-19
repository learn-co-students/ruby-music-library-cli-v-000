module Concerns::Findable

  def find_by_name(name)
    all.detect{ |song| song.name == name }
  end
  
  def find_or_create_by_name(name)
    if !find_by_name(name)
      create(name)
    else
      find_by_name(name)
    end
  end



end