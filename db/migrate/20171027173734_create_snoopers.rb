class CreateSnoopers < ActiveRecord::Migration[5.1]
  def change
    create_table :snoopers do |t|
      t.belongs_to :event, index: true
      t.string :facebook_token
      t.string :facebook_event_url

      t.timestamps
    end
  end
end
