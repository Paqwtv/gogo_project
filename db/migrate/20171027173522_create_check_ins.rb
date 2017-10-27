class CreateCheckIns < ActiveRecord::Migration[5.1]
  def change
    create_table :check_ins do |t|
      t.belongs_to :profile, index: true
      t.boolean :sheck_in_url
      t.boolean :secret_key

      t.timestamps
    end
  end
end
