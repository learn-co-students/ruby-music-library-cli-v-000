module Concerns

  module Findable

    def find_by_name(song)
      all.find {| s | s.name == song}
    end

  end

end
