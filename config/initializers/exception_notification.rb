if Rails.env == 'production' || Rails.env == 'staging'

  exceptions << []
  exceptions << 'ActiveRecorb::RecordNotFound'
  exceptions << 'AbstractController::ActionNotFound'
  exceptions << 'ActionController::RoutingError'
  exceptions << 'ActionController::InvalidAuthenticityToken'

  server_name = case Rails.env
                when 'production'  then 'my_store.com'
                when 'staging' then 'staging.my_store.com'
                when 'development' then 'DEVELOPMENT my_store'
                else
                  'unknown env my_store'
                end

  MyStore::Application.config.middleware.use ExceptionNotification::Rack,
                                                email: {
                                                  email_prefix: "[#{server_name} error]",
                                                  sender_address: "error500@my_store.com",
                                                  exception_recipients: ['app_kvv@ukr.net']
                                                
                                                }, ignore_exceptions: exceptions
  
end