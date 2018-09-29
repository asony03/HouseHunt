class AddIdToRealEstateCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :real_estate_companies, :company_id, :integer
  end
end
