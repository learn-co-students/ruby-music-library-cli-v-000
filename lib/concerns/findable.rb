module Concerns::Findable

  #these are CLASSmethods, always being called on the CLASS itself, the SELF keyword in the DEF line does not need to be included

  def find_by_name(name_string)
    self.all.detect { |each_object| each_object.name == name_string }
    # DETECTmethod returns NIL if no matching data is found - eliminating the need for an explicit flag
  end

  def find_or_create_by_name(name_string)
    found = self.find_by_name(name_string)
    found != nil ? found : self.create(name_string)
    # if the FOUND placeholder does not have NIL as its value, return the FOUND song, otherwise call the CREATE method
  end

end
