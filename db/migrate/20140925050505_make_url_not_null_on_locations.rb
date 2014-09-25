class MakeUrlNotNullOnLocations < ActiveRecord::Migration
  def change
  	change_column_null :locations, :url, false
  end
end
