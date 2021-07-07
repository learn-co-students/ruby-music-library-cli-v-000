require './lib/artist.rb'
class Genre<Artist
    extend Concerns::Findable

    def artists
        artists = self.songs.collect do |song|
          song.artist
        end
        artists.uniq
    end

end 