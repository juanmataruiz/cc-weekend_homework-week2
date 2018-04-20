class Rooms

  attr_reader(:name, :guests, :songs)

  def initialize(name)
    @name = name
    @guests = []
    @songs = []
  end

  def count_guests()
    @guests.size()
  end

  def count_songs()
    @songs.size()
  end

  def check_in_guests(guest)
    @guests.push(guest)
  end

  def check_out_guests(guest)
    @guests.delete(guest)
  end

  def add_songs_to_room(song)
    @songs.push(song)
  end


end
