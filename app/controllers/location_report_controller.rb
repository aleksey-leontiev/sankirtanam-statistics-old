class LocationReportController < ApplicationController
  def index
  	locationp = params[:location]
    yearp = params[:year]
    monthp = params[:month]
    location_report_data = LocationReportView.where{(location_url==locationp) & (year==yearp) & (month==monthp)}

    @report = []
    @month  = monthp.to_i
    @location_url = locationp
    @year = yearp
    @total = {huge:0,big:0,medium:0,small:0,quantity:0,score:0}

    for record in location_report_data
      @total[:huge] += record.huge
      @total[:big] += record.big
      @total[:medium] += record.medium
      @total[:small] += record.small
      @total[:quantity] += record.quantity
      @total[:score] += record.score
      
      @report << { name: record.name,
                   huge: record.huge,
                   big:  record.big,
                   medium: record.medium,
                   small: record.small,
                   quantity: record.quantity,
                   score: record.score }
    end
  end
end
