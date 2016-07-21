## Redmine omniauth GitLab

This plugin is used to authenticate Redmine users using GitLab's OAuth2 provider.

### Installation:

Download the plugin and install required gems:

```console
cd /path/to/redmine/plugins
git clone https://github.com/ocaisa/redmine_omniauth_gitlab.git
cd /path/to/redmine
bundle install
```

Restart the app
```console
touch /path/to/redmine/tmp/restart.txt
```

### Registration

To authenticate via GitLab you must first register your redmine instance with GitLab at "https://your.gitlab.server/admin/applications" where "your.gitlab.server" is the address of the GitLab server you want to use for authentication

* Type a name for the application, e.g. "My Redmine"
* Enter "https://mydomain.com/redmine/oauth2callback", where "mydomain.com/redmine" is the domain / path for your redmine instance. *** The plugin will not work without this setting ***
* Click "Submit"
* Save the Client ID and Client Secret for the configuration of the Redmine plugin (see below)

### Configuration

* Login as a user with administrative privileges. 
* In top menu select "Administration".
* Click "Plugins"
* In plugins list, click "Configure" in the row for "Redmine Omniauth GitLab plugin"
* Enter the Сlient ID & Client Secret shown when you registered your application via GitLab.
* Check the box near "Oauth authentication"
* Click Apply. 
 
Users can now to use their GitLab Account to log in to your instance of Redmine.

Additionaly
* Setup value Autologin in Settings on tab Authentification

### Other options

By default, all user email domains are allowed to authenticate through GitLab.
If you want to limit the user email domains allowed to use the plugin, list one per line in the  "Allowed domains" text box.

For example:

```text
onedomain.com
otherdomain.com
```

With the above configuration, only users with email addresses on the domains "onedomain.com" and "otherdomain.com" will be allowed to acccess your Redmine instance using GitLab OAuth.

### Authentication Workflow

1. An unauthenticated user requests the URL to your Redmine instance.
2. User clicks the "Login via GitLab" buton.
3. The plugin redirects them to a GitLab sign in page if they are not already signed in to their GitLab account.
4. GitLab redirects user back to Redmine, where the GitLab OAuth plugin's controller takes over.

One of the following cases will occur:
1. If self-registration is enabled (Under Administration > Settings > Authentication), user is redirected to 'my/page'
2. Otherwse, the an account is created for the user (referencing their GitLab OAuth2 ID). A Redmine administrator must activate the account for it to work.
