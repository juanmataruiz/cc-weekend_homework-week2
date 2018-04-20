class Guests

  attr_reader(:name)
  attr_accessor(:wallet)

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def remove_cash(fee)
    @wallet -= fee
  end

  def check_enough_cash(fee)
    @wallet >= fee
  end



end
