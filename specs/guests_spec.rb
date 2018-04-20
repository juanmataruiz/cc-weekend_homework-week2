require('minitest/autorun')
require('minitest/rg')
require_relative('../guests')

class GuestsTest < Minitest::Test

  def setup
    @guest1 = Guests.new('Mara')
    @guest2 = Guests.new("Alex")
    @guest3 = Guests.new("Marco")
  end

  def test_guess_name
    assert_equal("Mara", @guest1.name)
  end

end
