class AuditsController < ApplicationController  
  def index
    @audits = Audit.search(params)
  end

  def create
    @audit = Audit.new(audit_params)
    @audit.save
  end
end

private

def audit_params
  params.require(:audit).permit(:affected_table, :operation_type, :election_id, :latest_known_data, :changed_by)
end