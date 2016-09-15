module TwilioMessageSender 

  def self.check_number(number)
    number = number.strip

    #remove non-numeric characters
    number = number.gsub(/\D/,'')
    #check length
    puts "Modified Number: #{number}"
    puts number.length

    if number.length == 11
      number = number
      puts "11 digit check go"
    elsif number.length == 10
      number = '1' + number
      puts "10 digit check go"
    else
      puts "Bad phone number"
    end
    #prepend plus sign
    number = '+' + number

    return number
  end

  def self.send(message_to_send, number_to_send_to ) 
    puts "Original number check #{number_to_send_to}"
    number_to_send_to = check_number(number_to_send_to)
    #check_message(message_to_send)
    puts "New number check #{number_to_send_to}"

    client.account.messages.create(
      :from => ENV['TWILIO_PHONE_NUMBER'],
      :to => number_to_send_to,
      :body => message_to_send
    )
  end

  private

  def self.client
    @twilio_client ||= 
      Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
  end

end
