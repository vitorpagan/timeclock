class CreateTimeSheets < ActiveRecord::Migration
  def change
    create_table :time_sheets do |t|
      t.datetime :closed_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
