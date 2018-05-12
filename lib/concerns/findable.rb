module Concerns::Findable


def find_by_name(name)
  all.each do |searchsong|
    if searchsong.name == name
      return searchsong
    end
  end
  false
  #all.detect{ |o| o.name == name }
 end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end


end
