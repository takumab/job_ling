class AddLocationToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :city, :string
  end
end
