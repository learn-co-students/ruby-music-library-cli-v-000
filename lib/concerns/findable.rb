module Concerns

  module Findable

    def song.find_by_name(name)
      @@all.find{|song| song.name == name}
    end

  end

end
