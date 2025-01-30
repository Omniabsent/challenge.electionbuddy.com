class Audit < ApplicationRecord

  def self.search(params)        
    if params[:search].nil? then
      Audit.all
    else  
      where(["external_id = ?", params[:search]])
    end
  end
end
