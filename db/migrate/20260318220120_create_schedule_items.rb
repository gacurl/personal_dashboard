class CreateScheduleItems < ActiveRecord::Migration[7.2]
  def change
    create_table :schedule_items do |t|
      t.string :title
      t.datetime :start_time
      t.text :notes

      t.timestamps
    end
  end
end
