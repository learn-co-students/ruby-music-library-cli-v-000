module Findable
  def find_by_name(name)
    all.find{|a| a.name == name}
  end
end
