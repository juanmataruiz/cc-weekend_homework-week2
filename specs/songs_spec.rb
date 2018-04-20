require('minitest/autorun')
require('minitest/rg')
require_relative('../songs')

class SongsTest < Minitest::Test

  def setup
    @song1 = Songs.new("Durmiendo sola", "Vanesa Martin")
    @song2 = Songs.new("Macarena", "Los del Rios")
    @song3 = Songs.new("La Bomba", "King Africa")
  end

  def test_find_song_name
    assert_equal("Macarena", @song2.title)
  end



end
