# config valid for current version and patch releases of Capistrano
lock "~> 3.19.1"

server '160.251.179.101', port: 50022, roles: [:app, :web, :db], primary: true
set :application, "myapp"
set :repo_url, "git@github.com:ruu2023/vpsproject2.git"
set :user,            'deploy'
set :ssh_options,     {
  forward_agent: true,
  user: fetch(:user),
  keys: %w(~/.ssh/id_rsa)
}


# Default branch is :master
set :branch, 'main'
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/myapp"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage"
append :linked_dirs, '.bundle'
append :linked_files, "config/master.key"
append :linked_files, "config/database.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :rbenv_type, :system
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} #{fetch(:rbenv_path)}/bin/rbenv exec"

set :bundle_jobs, 2

# debug log level
set :log_level, :debug