module Concerns::Findable

  def find_by_name(name)
    all.detect{|a| a.name == name}
  end

  def find_or_create_by_name(name)
      find_by_name(name) || create(name)
      #changed if else to this
      #execute left side if it evaluates to true, otherwise execute right side
  end

end
#can get rid of self as this module is being referenced as a Class Method module
