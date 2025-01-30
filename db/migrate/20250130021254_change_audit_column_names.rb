class ChangeAuditColumnNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :audits, :opperation_type, :operation_type
    rename_column :audits, :external_id, :election_id
  end
end
