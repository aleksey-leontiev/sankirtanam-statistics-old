class RenameScoreToScoresForLocationReportView < ActiveRecord::Migration
  def up
    execute %{
      drop view location_report_views;
    }
    execute %{
      create view location_report_views as
        select
          records.name,
          records.huge,
          records.big,
          records.medium,
          records.small,
          (records.huge + records.big + records.medium + records.small) as quantity,
          (records.huge * 2 + records.big * 1 + records.medium * 0.5 + records.small * 0.25) as scores,
          locations.url as location_url,
          reports.year,
          reports.month
        from records
          inner join reports on records.report_id = reports.id
          inner join locations on reports.location_id = locations.id
    }
  end
  
  def down
    execute %{
      drop view location_report_views;
    }
    execute %{
      create view location_report_views as
        select
          records.name,
          records.huge,
          records.big,
          records.medium,
          records.small,
          (records.huge + records.big + records.medium + records.small) as quantity,
          (records.huge * 2 + records.big * 1 + records.medium * 0.5 + records.small * 0.25) as score,
          locations.url as location_url,
          reports.year,
          reports.month
        from records
          inner join reports on records.report_id = reports.id
          inner join locations on reports.location_id = locations.id
    }
  end
end
