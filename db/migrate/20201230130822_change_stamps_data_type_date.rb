class ChangeStampsDataTypeDate < ActiveRecord::Migration[6.0]
  def up
    change_table :stamps do |t|
      t.change :date, :date
    end
  end

  def down
    change_table :stamps do |t|
      t.change :date, :datetime
    end
  end
end
