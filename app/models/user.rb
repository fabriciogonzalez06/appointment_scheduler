class User < ApplicationRecord
    has_secure_password
    # attr_accessible :email, :password, :password_confirm 

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    validates :password, presence: true
    validates :password_confirmation, presence: true

end
