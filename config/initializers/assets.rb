Rails.application.config.assets.precompile += %w( ie7.css ie.css fix-ie7.js )
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
