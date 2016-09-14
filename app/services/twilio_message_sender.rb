module TwilioMessageSender 

  def check_number(number)
    number = number.strip

    #remove non-numeric characters
    number = number.gsub('/\D/','')
    #check length
    
  end

  def self.send(message_to_send, number_to_send_to ) 
    #check_number(number_to_send_to)
    #check_message(message_to_send)

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
