raw_config = File.read(RAILS_ROOT + "/config/config.yml")
CONFIG = YAML.load(raw_config)["common"].merge(YAML.load(raw_config)[RAILS_ENV])


begin
  unless RAILS_ENV=='test'
    rev = %x[git describe]
  else
    rev = "test"
  end
rescue Errno::ENOENT # git not installed
  rev = "not available"
end

CONFIG["app"]["revision"] = rev.gsub(/M/,"")