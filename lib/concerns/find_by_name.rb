module Concerns::Find_by_name
def find_by_name(name)
  all.detect{|o| o.name == name}
end
end
