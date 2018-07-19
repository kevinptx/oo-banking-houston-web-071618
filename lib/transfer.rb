class Transfer
  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @amount = amount
    @receiver = receiver
    @sender = sender
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if !(@sender.valid? && @receiver.valid?)
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @sender.balance > @amount && @status == "pending"
      @status = "complete"
      old_balance = @sender.balance
      new_balance = old_balance - @amount
      @sender.balance = new_balance
      @receiver.deposit(@amount)
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      old_balance = @receiver.balance
      new_balance = old_balance - @amount
      @receiver.balance = new_balance
      @sender.deposit(@amount)
    end
  end
end
