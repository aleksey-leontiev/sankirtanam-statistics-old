class WelcomeController < ApplicationController
  def index
    overall_report_data = OverallReportView.all
    report = {}

    for record in overall_report_data
      r = (report[record.location_name] ||= {location_name: record.location_name, "1" => 0, "2" => 0, "3" => 0, "4" => 0, "5" => 0, "6" => 0, "7" => 0, "8" => 0, "9" => 0, "10" => 0, "11" => 0, "12" => 0, :q=>0, :s=>0})
      r[record.month.to_s] = record.scores
      r["s"] = record.scores
      r["q"] = record.scores
    end

    @overall_report = report
  end
end