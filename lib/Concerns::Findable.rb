module Concerns::Findable
  def find_by_name(name)
    arr = self.all
    rtn = arr.detect { |e| e.name == name}
    rtn
  end

  def find_or_create_by_name(name)
    rtn = self.find_by_name(name)
    if !!rtn
      return rtn
    else
      self.create(name)
    end
  end
end
