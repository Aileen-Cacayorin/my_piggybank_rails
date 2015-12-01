require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.every '10m' do
  Allowance.deposit_allowance
end
