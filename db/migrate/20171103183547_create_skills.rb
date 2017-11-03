class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :title
      t.decimal :percent_utilized, precision: 12, scale: 5

      t.timestamps
    end
  end
end
