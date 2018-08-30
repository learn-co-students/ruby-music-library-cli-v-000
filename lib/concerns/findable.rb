module Concerns::Findable
  def find_by_name(name)
    all.find {|songs| songs.name == name}
  end

  def find_or_create_by_name(name)
    !!find_by_name(name) == true ? find_by_name(name) : create(name)
  end
end
