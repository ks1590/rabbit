# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.precompile += %w( nav.js )
Rails.application.config.assets.precompile += %w( calendar.js )
Rails.application.config.assets.precompile += %w( chart.js )
Rails.application.config.assets.precompile += %w( user.js )
Rails.application.config.assets.precompile += %w( calculator.js )

Rails.application.config.assets.precompile += %w(top.css)
Rails.application.config.assets.precompile += %w(nav.css)
Rails.application.config.assets.precompile += %w(users.css)
Rails.application.config.assets.precompile += %w(devise.css)
Rails.application.config.assets.precompile += %w(calendar.css)
Rails.application.config.assets.precompile += %w(chart.css)
Rails.application.config.assets.precompile += %w(calcurator.css)