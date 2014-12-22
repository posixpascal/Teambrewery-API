# Be sure to restart your server when you modify this file.
ActiveRecord::SessionStore::Session.attr_accessible :data, :session_id
Rails.application.config.session_store :active_record_store
