# helper method
module KnowsTheUserInterface

  class UserInterface
    include Capybara::DSL

    attr_accessor :message

    def withdraw_from(account, amount)
      Sinatra::Application.account = account
      visit '/'
      fill_in 'Amount', :with => amount
      click_button 'Withdraw'
    end

  end

  def my_account
    @my_account ||= Account.new
  end

  def cash_slot
    Sinatra::Application.cash_slot
  end

  def teller
    @teller ||= UserInterface.new
  end

  def message
    Sinatra::Application.teller.message
  end

end

World(KnowsTheUserInterface)
