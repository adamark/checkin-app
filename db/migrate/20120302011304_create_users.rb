class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :status
      t.string :location
      t.string :profile_pic
      t.string :full_name

      t.timestamps
    end
  end
end
