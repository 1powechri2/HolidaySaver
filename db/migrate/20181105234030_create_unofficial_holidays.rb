class CreateUnofficialHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table :unofficial_holidays do |t|
      t.string :name
      t.string :day
      t.string :category

      t.timestamps
    end
  end
end
