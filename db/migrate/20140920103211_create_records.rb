class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.references :report, index: true
      t.string :name
      t.integer :huge
      t.integer :big
      t.integer :medium
      t.integer :small
    end
  end
end
