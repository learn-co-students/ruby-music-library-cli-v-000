module Concerns::Findable

  def self.find_by_name(name_string)
    self.all.detect { |each_object| each_object.name == name_string }
    # DETECTmethod returns NIL if no matching data is found - eliminating the need for an explicit flag
  end

  def self.find_or_create_by_name(name_string)
    found = self.find_by_name(name_string)
    found != nil ? found : self.create(name_string)
    # if the FOUND placeholder does not have NIL as its value, return the FOUND song, otherwise call the CREATE method
  end

end
