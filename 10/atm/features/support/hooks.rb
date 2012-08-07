After do
  # Customer takes cash, leaving drawer empty
  cash_slot.contents = 0
  File.delete('balance')
end

Before do
  TransactionQueue.clear
end