class RemoveUserIdFromStamps < ActiveRecord::Migration[6.0]
  def change
    remove_reference :stamps, :user, foreign_key: true
  end
end
