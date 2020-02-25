class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = status
  end 
  
  def valid?
    if @sender.valid? && @receiver.valid?
      return true 
    else 
      return false 
    end 
  end 
  
  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount 
      @receiver.balance += @amount
      @status = "complete"
    else 
      @status = "rejected"
    end 
  end 
  
end
