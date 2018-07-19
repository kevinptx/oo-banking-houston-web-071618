class BankAccount
  attr_reader :name, :balance
  attr_accessor :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def balance=(amount)
    @balance = amount
    @status = "closed" if self.balance < 1
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    self.status = "closed"
  end
end
