class CreateInvitees < ActiveRecord::Migration[5.2]
  def change
    create_table :invitees do |t|
      t.references :view_party, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :accepted?

      t.timestamps
    end
    add_index :invitees, [:view_party_id, :user_id]
  end
end
