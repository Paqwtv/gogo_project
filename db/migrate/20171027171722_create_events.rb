class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.belongs_to :profile, index: true
      t.string :author
      t.string :title
      t.text :description
      t.string :date_time
      t.float :latitude
      t.float :longitude
      t.boolean :private, null: false, default: false
      t.string :address
      t.string :contacts
      t.integer :checked_by_as, limit: 2
      t.string :secret_key

      t.timestamps
    end
  end
end
