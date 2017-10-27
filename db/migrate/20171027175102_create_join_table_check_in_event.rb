class CreateJoinTableCheckInEvent < ActiveRecord::Migration[5.1]
  def change
    create_join_table :check_ins, :events do |t|
      t.index [:check_in_id, :event_id]
      t.index [:event_id, :check_in_id]
    end
  end
end
