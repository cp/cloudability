require_relative '../../helper'

class TestCloudability < Test::Unit::TestCase
  context "Time Helper :: When using time_helper, it" do
    setup do
      @mock_dt = DateTime.parse("2012-11-02T00:00:00+00:00")
      @real_dt = DateTime.now
      @timehelper = TimeHelper.new
    end

    should "return the current month in YYYY-MM-01" do
       currrent_month = DateTime.now.strftime("%Y-%m-01")
       @timehelper.current_month.should == currrent_month
    end

    should "return a Mash with the last three months in YYYY-MM-01" do
      months = @timehelper.last_three_months
      months.current.should == "2012-12-01"
      months.last.should    == "2012-11-01"
      months.three.should   == "2012-10-01"
    end

  end
end