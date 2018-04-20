require('minitest/autorun')
require('minitest/rg')
require_relative('../guests')
require_relative('../rooms')


class GuestsTest < Minitest::Test

  def setup
    @guest1 = Guests.new('Mara', 50)
    @guest2 = Guests.new("Alex", 10)
    @guest3 = Guests.new("Marco", 50)

    @room1 = Rooms.new("Poplar", 3, 100, 20)

  end

  def test_guess_name
    assert_equal("Mara", @guest1.name)
  end

  def test_guest_wallet
    assert_equal(50, @guest1.wallet)
  end

  def test_guest_has_enough_cash_in_wallet__true
    result = @guest1.check_enough_cash(@room1.fee)
    assert_equal(true, result)
  end

  def test_guest_has_enough_cash_in_wallet__false
    result = @guest2.check_enough_cash(@room1.fee)
    assert_equal(false, result) 
  end

  def test_remove_cash_from_wallet
    @guest1.remove_cash(@room1.fee)
    assert_equal(30, @guest1.wallet)
  end


end
