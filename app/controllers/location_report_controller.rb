class LocationReportController < ApplicationController
  def index
  	locationp = params[:location]
    yearp = params[:year]
    monthp = params[:month]
    location_report_data = LocationReportView.where{(location_url==locationp) & (year==yearp) & (month==monthp)}

    @report = []

    for record in location_report_data
      @report << { name: record.name,
                   huge: record.huge,
                   big:  record.big,
                   medium: record.medium,
                   small: record.small,
                   quantity: record.quantity,
                   score: record.score }
      #r = (@report[record.name] ||= {name: record.name, "1" => 0, "2" => 0, "3" => 0, "4" => 0, "5" => 0, "6" => 0, "7" => 0, "8" => 0, "9" => 0, "10" => 0, "11" => 0, "12" => 0, :q=>0, :s=>0})
      #r[record.month.to_s] = record.score
      #r["s"] = record.scores
      #r["q"] = record.scores
    end
  end
end
