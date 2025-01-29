class RefactorAuditsTableStructure < ActiveRecord::Migration[6.1]
  def change
    rename_column :audits, :new_data, :latest_known_data
    add_column :audits, :external_id, :integer
    add_column :audits, :changed_by, :string
    add_column :audits, :opperation_type, :string
  end
end
