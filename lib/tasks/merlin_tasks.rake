namespace :merlin do
  desc "Print configuration for current environment"
  task :config => :environment do
    y Merlin.raw
  end
end
