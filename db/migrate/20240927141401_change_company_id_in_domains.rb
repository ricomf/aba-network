class ChangeCompanyIdInDomains < ActiveRecord::Migration[7.0]
  def change
    remove_column :domains, :company_id, :integer

    add_reference :domains, :company, foreign_key: true, null:false

    add_index :company_domains, [:company_id, :domain_id], unique: true unless index_exists?(:company_domains, [:company_id, :domain_id])
  end
end
