require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.every '1h' do
  Allowance.deposit_allowance
end
