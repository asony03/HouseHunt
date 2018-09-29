class RemoveCompanyIdFromRealEstateCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :real_estate_companies, :company_id, :integer
  end
end
