class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |table|
      table.integer :user_id
      table.integer :meetup_id
    end
  end
end
