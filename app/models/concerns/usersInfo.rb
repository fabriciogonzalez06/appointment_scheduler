module UsersInfo
    extend ActiveSupport::Concern

    VALID_ROLES = ['client', 'admin', 'mechanic']
    
    included do 
        validates :role, inclusion: { in: VALID_ROLES }
    end 

    class_methods do 
        def platform_count 
            where.not(role: 'client' )
        end 
    end 

    def client_user? 
        role == 'client'
    end 
end 