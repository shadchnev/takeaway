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

  it "should raise an error if the price is not correct" do
    expect(lambda { takeaway.wrong_price }).to raise_error(RuntimeError)
  end

  it "needs to know the time" do
    @time_now = Time.parse("2013-12-09 06:55:59 +0000")
    Time.stub(:now).and_return(@time_now)
    expect(takeaway.time).to eq(Time.now)
  end

  # TTT gem for writing rspec test with twilio or webmock

  it "needs to send a confirmation message stating the time of delivery" do
    @twilio_text = send_message.parse("Hi! Thanks for using Chris. Your order is successful and will be delivered at 2013-12-09 08:46:36 +0000")
    send_message.stub(:message).and_return(@twilio_text)
    expect(takeaway.send_message) #to send_message ??
  end

  # I think I must be online to test twilio?

end