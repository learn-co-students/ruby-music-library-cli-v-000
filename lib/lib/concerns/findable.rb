module Concerns::Findable
  def find_by_name(name)
    all.detect{|a| a.name == name}
  end

  def find_or_create_by_name(name)
     song = self.find_by_name(name)
      if song == nil


      self.create(name)
else song

    end
    end








end
