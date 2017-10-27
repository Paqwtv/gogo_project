class CreateJoinTableChatRoomsProfiles < ActiveRecord::Migration[5.1]
  def change
    create_join_table :chat_rooms, :profiles do |t|
      t.index [:chat_room_id, :profile_id]
      t.index [:profile_id, :chat_room_id]
    end
  end
end
