class AddNotesToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :notes, :text, null: true
  end
end
