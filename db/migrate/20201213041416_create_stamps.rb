class CreateStamps < ActiveRecord::Migration[6.0]
  def change
    create_table :stamps do |t|
      t.datetime :date
      t.boolean :stamp_checked
      t.references :calendar, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
