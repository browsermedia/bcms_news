# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bcms_news_session',
  :secret      => 'a9adeb5a2c5894f3a51b866ef341e6ad1924a7bdfafa31ad19d18570e2b3c841afa8bb90ec722d19da8e14e525faaba5d13d0a4f12b30e8c8d55b5525c5352c9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
