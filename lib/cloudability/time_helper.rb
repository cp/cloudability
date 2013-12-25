require 'date'
require 'hashie'

# Cloudability requires time periods formatted in YYYY-MM-01 The date must always be 1.
# This provides a set of helpers to always return the correct period format.

class TimeHelper

  def last_three_months
    dt = DateTime.now

    current_month = dt.strftime("%Y-%m-01")
    last_month    = (dt << 1).strftime("%Y-%m-01")
    three_month   = (dt << 2).strftime("%Y-%m-01")
   
    hash = { current: current_month, last: last_month, three: three_month }    
    Hashie::Mash.new(hash)
  end

  # Returns the current month
  def current_month
    DateTime.now.strftime("%Y-%m-01")
  end

end