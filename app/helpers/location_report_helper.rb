module LocationReportHelper
  def pagination_class(month)
    @month == month ? 'active' : ''
  end
end
