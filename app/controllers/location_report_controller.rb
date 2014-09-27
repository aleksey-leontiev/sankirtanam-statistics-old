class LocationReportController < ApplicationController
  def index
  	param_location_url = params[:location]
  	param_year         = params[:year].to_i
  	param_month        = params[:month].to_i
  	
    location_report_data =
      LocationReportView.where{
        (location_url == param_location_url) &
        (year         == param_year) &
        (month        == param_month)}
    chart_data = LocationReportView.where{
      (location_url   == param_location_url) & 
      (year           == param_year)}
      .group{:month}.sum(:score)

    @report = []
    @month_names = Date::MONTHNAMES
    
    total_month = {huge:0, big:0, medium:0, small:0, quantity:0, score:0}    
    total_year  = {1=>0, 2=>0, 3=>0, 4=>0, 5=>0, 6=>0, 7=>0, 8=>0, 9=>0, 10=>0, 11=>0, 12=>0}
   
    chart_data = total_year.merge(chart_data)
    chart_data = Hash[chart_data.map {|k, v| [@month_names[k], v] }]

    for record in location_report_data
      total_month[:huge] += record.huge
      total_month[:big] += record.big
      total_month[:medium] += record.medium
      total_month[:small] += record.small
      total_month[:quantity] += record.quantity
      total_month[:score] += record.score
      
      @report << { name: record.name,
                   huge: record.huge,
                   big:  record.big,
                   medium: record.medium,
                   small: record.small,
                   quantity: record.quantity,
                   score: record.score }
    end
    
    @location_url = param_location_url
    @year = param_year
    @month = param_month
    @chart_data = chart_data
    @total_month = total_month
  end
end
