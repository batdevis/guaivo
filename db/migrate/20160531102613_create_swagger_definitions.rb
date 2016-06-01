class CreateSwaggerDefinitions < ActiveRecord::Migration[5.0]
  def change
    create_table :swagger_definitions do |t|
      t.string :name, null: true
      t.string :definition, null: false
      t.references :project
      t.timestamps
    end

    #add_foreign_key :swagger_definitions, :project
  end
end
