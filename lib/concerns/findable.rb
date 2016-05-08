
module 
  Concerns::Findable

def find_by_name(name)
  self.all.detect {|x| x.name == name}
end


def find_or_create_by_name(name)


  if self.all.detect { |x| x.name == name } != nil
    self.all.detect { |x| x.name == name } 
  else
    self.create(name)
  end
end




end