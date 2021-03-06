require('minitest/autorun')
require('minitest/rg')
require_relative('../rooms')
require_relative('../guests')
require_relative('../songs')


class RoomsTest < Minitest::Test

  def setup

    @room1 = Rooms.new("Poplar", 3, 100, 20)
    @room2 = Rooms.new("Camden", 3, 100, 20)
    @room3 = Rooms.new("Chelsea", 5, 100, 20)

    @guest1 = Guests.new('Mara', 50)
    @guest2 = Guests.new("Alex", 50)
    @guest3 = Guests.new("Marco", 50)

    @song1 = Songs.new("Durmiendo sola", "Vanesa Martin")
    @song2 = Songs.new("Macarena", "Los del Rios")
    @song3 = Songs.new("La Bomba", "King Africa")

  end

  def test_find_room
    assert_equal("Poplar", @room1.name)
  end

  def test_count_guests_to_room
    assert_equal(0, @room1.count_guests)
  end

  def test_count_songs_to_room
    assert_equal(0, @room1.count_songs)
  end

  def test_check_in_guests
    @room1.check_in_guests(@guest1)
    assert_equal(1, @room1.count_guests)
  end

  def test_check_out_guests
    @room2.check_in_guests(@guest1)
    @room2.check_in_guests(@guest3)
    @room2.check_out_guests(@guest1)
    assert_equal(1, @room2.count_guests)
  end

  def test_add_songs_to_room
    @room1.add_songs_to_room(@song1)
    assert_equal(1, @room1.count_songs)
  end

  def test_room_capacity
    assert_equal(3, @room2.capacity)
  end

  def test_room_is_at_full_capacity
    @room2.check_in_guests(@guest1)
    @room2.check_in_guests(@guest2)
    @room2.check_in_guests(@guest3)
    assert_equal(true, @room2.room_full())
  end

  def test_room_has_capacity
    @room1.check_in_guests(@guest1)
    @room1.check_in_guests(@guest2)
    assert_equal(false, @room1.room_full())
  end

  def test_cannot_check_in_guest_if_room_is_full
    new_guest = Guests.new("Jack",20)
    @room2.check_in_guests(@guest1)
    @room2.check_in_guests(@guest2)
    @room2.check_in_guests(@guest3)
    @room2.check_in_guests(new_guest)
    assert_equal(3, @room2.count_guests)
    assert_equal(true, @room2.room_full())
  end

  def test_initial_till_amount
    assert_equal(100, @room1.till)
  end

  def test_add_or_remove_cash_from_till__add
    assert_equal(120, @room1.add_cash())
  end

  def test_add_or_remove_cash_from_till__remove
    assert_equal(80, @room1.remove_cash())
  end

  def test_room_has_favourite_song
    result = @room1.favourite_song(@song2)
    assert_equal("Whoo! We have your favourite song.", result)
  end

end
