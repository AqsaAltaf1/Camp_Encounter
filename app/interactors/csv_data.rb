class CsvData
  include Interactor

  def call
    context.csv_data = CSV.generate(headers: true) do |csv|
      csv << context.klass_obj

      context.klass_obj.each do |data|
        csv << data.attributes.values
      end
    end
  end
end
