class Takeaway

  MENU = {:pizza => 7, :kebab => 5}

  def menu
   MENU
  end

  def order
    MENU.each do |key, value|
    @items = [:pizza, :kebab]
    end
  end

  def price_checker
    (order.values).inject { |a, b| a + b }
    # { |value| sum = yield(sum, value) }
  end

  def wrong_price
    !price_checker
    raise "sorry, incorrect price"
  end

  def time
    Time.now
  end




end
=begin
=end



# array class
#