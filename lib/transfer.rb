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
    #binding.pry
    if @amount <= @sender.balance
        @sender.balance = (@sender.balance - @amount)
        @receiver.balance += @amount
        @amount = 0
        self.status = "complete"
    else
      return "Transaction rejected. Please check your account balance."
    end


  end

end
