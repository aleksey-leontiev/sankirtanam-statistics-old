class UpdateOverallReportViewScores < ActiveRecord::Migration
  def up
    execute %{
      drop view overall_report_views;
    }
    
    execute %{
      create view overall_report_views as
        select
          locations.name as location_name,
          locations.url as location_url,
          sum(records.huge * 2 + records.big * 1 + records.medium * .5 + records.small * .25) AS scores,
          reports.year,
          reports.month
        from records
          join reports ON records.report_id = reports.id
          join locations ON reports.location_id = locations.id
        group by 
          locations.id,
          reports.year,
          reports.month
        order by
          reports.year,
          reports.month;
    }    
  end
  
  def down
    execute %{
      drop view overall_report_views;
    }
    execute %{
      create view overall_report_views as
   SELECT locations.name AS location_name, locations.url as location_url, sum(records.huge + records.big + records.medium + records.small) AS scores, reports.year, reports.month
   FROM records
   JOIN reports ON records.report_id = reports.id
   JOIN locations ON reports.location_id = locations.id
  GROUP BY locations.id, reports.year, reports.month
  ORDER BY reports.year, reports.month;
    }
  end
end
