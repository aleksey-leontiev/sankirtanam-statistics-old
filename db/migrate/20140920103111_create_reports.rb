class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :location, index: true
      t.integer :month
      t.integer :year
    end
  end
end
