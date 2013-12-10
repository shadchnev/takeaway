require_relative '../lib/takeaway.rb'

# Chris, these code isn't perfect but it's a big improvement
# compared to what you were writing a couple weeks ago

describe Takeaway do
  
  let(:takeaway) {Takeaway.new}

  # You're testing too much here. Don't worry about it being a Hash
  # If there's no menu, then other tests will fail
  it 'should have a menu' do
    expect(takeaway.menu).to be_a(Hash)
  end

  it "should take an order" do
    # here, you create a local variable order
    order = {:pizza => 2}
    # it has nothing to do with the return value of the order() method
    # that you're calling here.
    # So this isn't a correct test
    expect(takeaway.order).to be_a(Hash)
  end

  # this test passes but for all the wrong reasons
  it "check the price of the order" do
    # this is a local variable again
    order = {:pizza => 1, :kebab => 1}
    # the order variable has nothing to do with the return value
    # of price_checker, which returns the sum of all prices in your menu
    # Basically, it will always return 12, no matter what.
    expect(takeaway.price_checker).to eq(12)
  end

  # Again, it passes but it's not a good test
  # The method wrong_price always raises an error. 
  # What you should have tried instead
  # is placing an order with an incorrect amount of money, and THEN
  # checking that it raises an error. 
  # Another test should have checked that there's no error if the 
  # amount of money is correct
  it "should raise an error if the price is not correct" do
    expect(lambda { takeaway.wrong_price }).to raise_error(RuntimeError)
  end

  # This is a reasonable test but the method doesn't 
  # make sense. It would make much more sense if
  # you had a method that returned current time + 1 hour instead
  it "needs to know the time" do
    @time_now = Time.parse("2013-12-09 06:55:59 +0000")
    Time.stub(:now).and_return(@time_now)
    expect(takeaway.time).to eq(Time.now)
  end

  # TTT gem for writing rspec test with twilio or webmock

  it "needs to send a confirmation message stating the time of delivery" do
    # this fails because you're calling method send_message that's defined
    # in the Takeaway class. You meant takeaway.send_message, right?
    @twilio_text = send_message.parse("Hi! Thanks for using Chris. Your order is successful and will be delivered at 2013-12-09 08:46:36 +0000")
    send_message.stub(:message).and_return(@twilio_text)
    expect(takeaway.send_message) #to send_message ??
  end

  # I think I must be online to test twilio?
  # Yes, to get the text but the tests shouldn't require an internet connection
  # They should stub out any calls to external services

end