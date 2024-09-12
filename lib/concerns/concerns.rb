module Concerns

  module Findable
    def find_by_name(name)
      all.detect{|e| e.name == name}
    end

    def find_or_create_by_name(name)
      (e = find_by_name(name)) ? e : self.create(name)
    end

    def list_all
      all.each { |e| puts "#{e.name}" }
    end

    def list_songs(name)
      self.find_by_name(name).songs.each { |song| song.print }
    end
  end

  module Creatable
    def create(name)
      item = self.new(name)
      item.save
      item
    end

    def destroy_all
      all.clear
    end
  end

  module Saveable
    def save
      self.class.all << self
    end
  end
end
