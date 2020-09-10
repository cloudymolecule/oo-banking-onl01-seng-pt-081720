require "pry"

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? == true && self.receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    elsif @status == "complete"
      puts "Transaction was already excuted"
    else
      @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "complete"
    end

    # #binding.pry
    # if @sender.balance < @amount
    #   @status = "rejected"
    #   return "Transaction rejected. Please check your account balance."
    # elsif
    #   @sender.balance = (@sender.balance - @amount)
    #   @receiver.balance += @amount
    #   @amount = 0
    #   self.status = "complete"

    end


  end

end
