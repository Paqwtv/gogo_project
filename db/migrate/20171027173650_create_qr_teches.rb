class CreateQrTeches < ActiveRecord::Migration[5.1]
  def change
    create_table :qr_teches do |t|
      t.string :qr_code

      t.timestamps
    end
  end
end
