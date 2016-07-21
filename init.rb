require 'redmine'
require_dependency 'redmine_omniauth_gitlab/hooks'

Redmine::Plugin.register :redmine_omniauth_gitlab do
  name 'Redmine Omniauth GitLab plugin'
  author 'Dmitry Kovalenok'
  description 'This is a plugin for Redmine registration through GitLab'
  version '0.0.1'
  url 'https://github.com/twinslash/redmine_omniauth_google'
  author_url 'http://twinslash.com'

  settings :default => {
    :client_id => "",
    :client_secret => "",
    :oauth_autentification => false,
    :allowed_domains => ""
  }, :partial => 'settings/gitlab_settings'
end
