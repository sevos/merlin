namespace :merlin do
  desc "Print configuration for current environment"
  task :config => :environment do
    y $merlin.raw
  end
end
