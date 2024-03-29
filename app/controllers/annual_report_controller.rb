class AnnualReportController < ApplicationController
  def index
    yearp = params[:year]
    annual_report_data = OverallReportView.where{year == yearp}
    @report = {}
    @year = yearp

    for record in annual_report_data
      r = (@report[record.location_name] ||= {location_name: record.location_name, location_url: record.location_url, "1" => 0, "2" => 0, "3" => 0, "4" => 0, "5" => 0, "6" => 0, "7" => 0, "8" => 0, "9" => 0, "10" => 0, "11" => 0, "12" => 0, :total=>0})
      r[record.month.to_s] = record.scores
      r[:total] += record.scores
    end
    
    @chart = annual_report_data.group{:location_url}.sum(:scores).sort_by {|_key, value| value}.reverse
  end
end
