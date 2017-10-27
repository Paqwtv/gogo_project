class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :events, index: true

      t.timestamps
    end
  end
end
