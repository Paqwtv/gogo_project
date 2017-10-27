class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.string :user_name
      t.string :gender

      t.timestamps
    end
  end
end
