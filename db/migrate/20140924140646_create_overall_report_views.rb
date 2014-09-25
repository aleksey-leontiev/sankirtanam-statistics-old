class CreateOverallReportViews < ActiveRecord::Migration
  def up
    execute %{
    	create view overall_report_views as
   SELECT locations.name AS location_name, sum(records.huge + records.big + records.medium + records.small) AS scores, reports.year, reports.month
   FROM records
   JOIN reports ON records.report_id = reports.id
   JOIN locations ON reports.location_id = locations.id
  GROUP BY locations.id, reports.year, reports.month
  ORDER BY reports.year, reports.month;
    }
  end

  def down
    execute "drop view overall_report_views;"
  end
end
