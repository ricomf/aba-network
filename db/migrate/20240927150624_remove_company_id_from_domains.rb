class RemoveCompanyIdFromDomains < ActiveRecord::Migration[7.0]
  def change
    remove_column :domains, :company_id, :integer

    change_column_null :domains, :domain_url, false
  end
end
