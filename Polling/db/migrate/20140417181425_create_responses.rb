class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :responder_id, null: false
      t.integer :answer_id, null: false

      t.timestamps
    end

    add_index :responses, :responder_id
    add_index :responses, :answer_id
  end
end
