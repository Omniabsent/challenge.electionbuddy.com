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
  params.require(:audit).permit(:affected_table, :new_data)
end