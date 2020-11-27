class Person < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :first_name, :last_name, :presence => true
    validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

    has_one :employee, dependent: :destroy
    has_one :customer, dependent: :destroy

    def name
        "#{first_name} #{last_name}"
    end
end
