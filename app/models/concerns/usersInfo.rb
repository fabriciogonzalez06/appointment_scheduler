module UsersInfo
    extend ActiveSupport::Concern

    VALID_TYPES = ['client', 'platform']
    
    included do 
        validates :user_type, inclusion: { in: VALID_TYPES }
    end 

    class_methods do 
        def platform_count 
            where(user_type: 'platform' )
        end 
    end 

    def platform_user? 
        user_type == 'platform'
    end 
end 