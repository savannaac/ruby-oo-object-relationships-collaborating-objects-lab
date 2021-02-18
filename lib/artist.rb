class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self 
        @songs = []
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        @songs << song
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        if self.all.detect { |artist| artist.name == name } 
            self.all.detect { |artist| artist.name == name }
        else 
             self.new(name)   
         end
    end
    
    def print_songs
        songs.each { |song| puts song.name }
    end
end