# encoding: utf-8

namespace :deploy_heroku do
    desc "Deploy application to the Heroku!"
    task :go do
        puts
        puts "Precompile assets to public/assets/"
        puts `git reset`
        puts `rake assets:precompile`
        puts `git add ./public/assets`
        puts `git commit -m "Precompiled public/assets"`

        puts
        puts "Deploy application to Heroku!"
        puts `git push heroku`
    end
end

