'''class User < ApplicationRecord
  has_secure_password
  has_many :lists, dependent: :destroy

  # Validações diretas com mensagens em português
  validates :name, presence: { message: "não pode ficar em branco" }
  validates :email, presence: { message: "não pode ficar em branco" },
                    uniqueness: { message: "já está em uso" }

  validates :password, presence: { message: "não pode ficar em branco" },
                       confirmation: { message: "e a confirmação devem ser iguais" }
  validates :password_confirmation, presence: { message: "não pode ficar em branco" }
end'''

class User < ApplicationRecord
  has_secure_password validations: false
  has_many :lists, dependent: :destroy

  validates :name, presence: { message: "Nome não pode ficar em branco" }
  validates :email, presence: { message: "E-mail não pode ficar em branco" },
                    uniqueness: { message: "E-mail já está em uso" }
  validates :password, presence: { message: "Senha não pode ficar em branco" },
                       confirmation: { message: "Senha e a confirmação devem ser iguais" }
  validates :password_confirmation, presence: { message: "Confirmação não pode ficar em branco" }

  # Sobrescreve full_messages para exibir apenas a mensagem
  def errors_full_messages
    errors.map(&:message)
  end
end
