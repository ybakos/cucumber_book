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

  def initialize(cash_slot)
    @cash_slot = cash_slot
  end

  def withdraw_from(account, amount)
    puts account.balance
    if (account.balance >= amount)
      account.debit(amount)
      @cash_slot.dispense(amount)
    else

    end
  end

end

class CashSlot

  attr_writer :contents

  def contents
    @contents || raise("I'm empty!")
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
  teller = Teller.new(settings.cash_slot)
  teller.withdraw_from(settings.account, params[:amount].to_i)
end
