After do
  # Customer takes cash, leaving drawer empty
  cash_slot.contents = 0
end

Before do
  BalanceStore.new.balance = 0
  TransactionQueue.clear
end