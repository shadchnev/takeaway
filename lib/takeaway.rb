require 'twilio-ruby'

class Takeaway

  MENU = {:pizza => 7, :kebab => 5}
  DELIVERY = Time.now + 3600
  #make the time look a bit nicer! e.g 19:36 for delivery. Time.now({ change })  ?? think for rails 

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

  def send_message
   # if price_checker
    #text do
   #??  I don't think this is correct i need to learn to rspec text write for twilio ??
      account_sid = 'ACecb4b1f21565ecc93c2a02d93fce811d'
      auth_token = '{{ 8820720da1cae123afda99970ed76bcd }}'
      @client = Twilio::REST::Client.new account_sid, auth_token
 
        message = @client.account.messages.create(:body => "Hi! Thanks for using Chris. Your order is successful and will be delivered at #{DELIVERY}",
          :to => "+447540706728",
          :from => "+441622523173",)
        puts message.to
      end
    #else wrong_price ??
    #end
  #end

end

=begin

# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'
 
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC5ef8732a3c49700934481addd5ce1659'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(:body => "Jenny please?! I love you <3",
    :to => "+15558675309",
    :from => "+14158141829",
    :media_url => "http://www.example.com/hearts.png")
puts message.to

My account??
http://twimlets.com/echo?Twiml=%3CResponse%3E%3CSms%3EHello+Chris%2C+thanks+for+the+message%21%3C%2FSms%3E%3C%2FResponse%3E

My Number??
+44 1622 523173     441622523173

=end
