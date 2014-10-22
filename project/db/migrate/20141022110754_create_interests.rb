class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :interest
      t.references :user

      t.timestamps
    end
  end
end
