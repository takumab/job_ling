class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :position
      t.text :description
      t.string :company

      t.timestamps null: false
    end
  end
end
