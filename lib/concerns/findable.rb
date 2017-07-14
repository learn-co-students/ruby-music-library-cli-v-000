module Concerns::Findable

def find_by_name(name)
    all.detect{|songs| songs.name == name}
end

end