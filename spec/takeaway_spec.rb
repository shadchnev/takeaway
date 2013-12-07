require_relative '../lib/takeaway.rb'

describe Takeaway do
  
let(:takeaway) {Takeaway.new}

  it 'should have a menu' do
    expect(takeaway.menu).to be_a(Hash)
  end

  it "should take an order" do
    order = {:pizza => 2}
    expect(takeaway.order).to be_a(Hash)
  end

  it "check the price of the order" do
    order = {:pizza => 1, :kebab => 1}
    expect(takeaway.price_checker).to eq(12)
  end


=begin
  it "should raise an error if the price is not correct" do
    expect(takeaway.wrong_price).should raise_error(RuntimeError, "sorry, incorrect price")
  end

  it "know the time" do
    expect(takeaway.time).to eq(Time.now)
  end
=end

end