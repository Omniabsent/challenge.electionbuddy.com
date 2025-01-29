class AuditsController < ApplicationController
  def index
    @audits = Audit.all
  end

  def create
    @audit = Audit.new(audit_params)
    @audit.save
  end
end

private

def audit_params
  params.require(:audit).permit(:affected_table, :opperation_type, :external_id, :latest_known_data, :changed_by)
end