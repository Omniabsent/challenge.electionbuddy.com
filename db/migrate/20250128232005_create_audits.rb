class CreateAudits < ActiveRecord::Migration[6.1]
  def change
    create_table :audits do |t|
      t.string :affected_table
      t.json :new_data

      t.timestamps
    end
  end
end
