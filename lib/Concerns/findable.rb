module Concerns::Findable

  def find_by_name(name)
    all.detect {|x| x.name == name}
  end


end
