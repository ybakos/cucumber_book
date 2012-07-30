class Account

  def credit(amount)
    @balance = amount
  end

  def balance
    @balance
  end

  def debit(amount)
    @balance -= amount
  end

end

class Teller

  attr_accessor :message

  def initialize(cash_slot)
    @cash_slot = cash_slot
  end

  def withdraw_from(account, amount)
    if (account.balance < amount)
      @message = "Insufficient funds brah!"
    else
      account.debit(amount)
      @cash_slot.dispense(amount)
      @message = "Thank you, have a nice day!"
    end
  end

end

class CashSlot

  attr_writer :contents

  def contents
    @contents ||= 0 # raise("I'm empty!")
  end

  def dispense(amount)
    @contents = amount
  end

end

require 'sinatra'
get '/' do
  %{
    <html><body>
      <form action="/withdraw" method="post">
        <label for="amount">Amount</label>
        <input type="text" id="amount" name="amount">
        <button type="submit">Withdraw</button>
      </form>
    </body></html>
  }
end

set :cash_slot, CashSlot.new
set :account do
  fail 'account has not been set'
end
post '/withdraw' do
  set :teller, Teller.new(settings.cash_slot)
  settings.teller.withdraw_from(settings.account, params[:amount].to_i)
end
