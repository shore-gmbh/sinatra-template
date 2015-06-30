namespace :git do
  namespace :tag do
    desc 'Tag OK integration'
    task :integration do
      name = "integration_#{Time.now.strftime('%y%m%d%H%M')}"

      puts "Tagging with #{name}"
      `git tag #{name} && git push origin #{name}`
    end

    desc 'Tag release on last OK integration'
    task :release do
      name = "release_#{Time.now.strftime('%y%m%d%H%M')}"

      puts "Tagging with #{name}"
      `git tag #{name} && git push origin #{name}`
    end
  end
end
