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
    @sender.balance = (@sender.balance - @amount)
    @receiver.balance += @amount
    binding.pry
    self.status = "complete"
  end

end
