class Domain < ApplicationRecord
  has_many :company_domains, dependent: :destroy
  has_many :companies, through: :company_domains

  validates :domain_url, presence: true, uniqueness: true
  validate :requires_company_association

  private

  # Verifica se o domínio está associado a pelo menos uma empresa
  def requires_company_association
    errors.add(:base, 'O domain deve estar associado a pelo menos uma company') if companies.empty?
  end

end
