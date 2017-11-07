module Concerns::Findable
  # Module code here
  def find_by_name(name)
    self.all.detect {|song| song.name == name }
  end

  def find_or_create_by_name(name)
    # self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    # if boolean == true ? do this positive thing : do this negative thing
     if !self.find_by_name(name)
       self.create(name)
     else
       self.find_by_name(name)
      # all.detect {|song| song.name == name || self.new(name) }
     end
  end

end
