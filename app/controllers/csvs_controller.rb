class CsvsController < ApplicationController

  def index
    @models = []
    ActiveRecord::Base.connection.tables.each do |table|
      @models << table.camelize.singularize
    end
  end

  def export
    model = params[:model]
    respond_to do |format|
      format.csv { send_data export_csv(model), filename: "#{model}.csv" }
    end
  end

  def export_csv model
    CSV.generate do |csv|
      csv << model.constantize.column_names
      model.constantize.all.each do |data|
        csv << data.attributes.values_at(*model.constantize.column_names)
      end
    end
  end
end
