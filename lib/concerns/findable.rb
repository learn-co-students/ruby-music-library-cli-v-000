module Concerns
  module Findable

  def find_by_name(name)
    obj = self.all.detect{|s| s.name == name}
  end

  def find_or_create_by_name(name)
    obj = self.find_by_name(name)
    if !obj #if not song
      obj = self.create(name)
    end
    obj
  end

  #include = instance methods

  #extends = class methods

  end

end
