class AuditsController < ApplicationController
  before_action :authenticate_user!
  
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
  params.require(:audit).permit(:affected_table, :opperation_type, :external_id, :latest_known_data, :changed_by)
end