class Rooms

  attr_reader(:name, :guests, :songs)
  attr_accessor(:till, :capacity, :fee)

  def initialize(name, capacity)
    @name = name
    @guests = []
    @songs = []
    @capacity = capacity
    @till = till
    @fee = fee
  end

  def count_guests()
    @guests.size()
  end

  def count_songs()
    @songs.size()
  end

  def check_in_guests(guest)
    @guests.push(guest) unless room_full
  end

  def check_out_guests(guest)
    @guests.delete(guest)
  end

  def add_songs_to_room(song)
    @songs.push(song)
  end

  def room_full()
    return count_guests >= @capacity
    # return "Room is full" if @guests.count == @capacity
    # return "This is not full yet" if @guests.count < @capacity
  end


end
