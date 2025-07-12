#!/bin/bash

echo "🚀 Starting Laravel AJAX CRUD Modal Deployment..."

# Check if Heroku CLI is installed
if ! command -v heroku &> /dev/null; then
    echo "❌ Heroku CLI is not installed. Please install it first:"
    echo "   https://devcenter.heroku.com/articles/heroku-cli"
    exit 1
fi

# Check if user is logged in to Heroku
if ! heroku auth:whoami &> /dev/null; then
    echo "❌ Please login to Heroku first:"
    echo "   heroku login"
    exit 1
fi

# Get app name from user
read -p "Enter your Heroku app name: " APP_NAME

# Create app if it doesn't exist
if ! heroku apps:info --app $APP_NAME &> /dev/null; then
    echo "📱 Creating new Heroku app: $APP_NAME"
    heroku create $APP_NAME
else
    echo "✅ App $APP_NAME already exists"
fi

# Set environment variables
echo "⚙️  Setting environment variables..."
heroku config:set APP_ENV=production --app $APP_NAME
heroku config:set APP_DEBUG=false --app $APP_NAME
heroku config:set CACHE_DRIVER=file --app $APP_NAME
heroku config:set SESSION_DRIVER=file --app $APP_NAME
heroku config:set QUEUE_DRIVER=sync --app $APP_NAME
heroku config:set DB_CONNECTION=mysql --app $APP_NAME

# Generate and set APP_KEY
echo "🔑 Generating APP_KEY..."
APP_KEY=$(php artisan key:generate --show)
heroku config:set APP_KEY="$APP_KEY" --app $APP_NAME

# Add MySQL addon if not exists
echo "🗄️  Adding MySQL database..."
if ! heroku addons:info heroku-mysql --app $APP_NAME &> /dev/null; then
    heroku addons:create heroku-mysql:mini --app $APP_NAME
else
    echo "✅ MySQL addon already exists"
fi

# Deploy to Heroku
echo "📤 Deploying to Heroku..."
git add .
git commit -m "Deploy to Heroku"
git push heroku main

# Run migrations
echo "🔄 Running database migrations..."
heroku run php artisan migrate --force --app $APP_NAME

# Clear and cache config
echo "🧹 Optimizing application..."
heroku run php artisan config:cache --app $APP_NAME
heroku run php artisan route:cache --app $APP_NAME
heroku run php artisan view:cache --app $APP_NAME

# Open the app
echo "🌐 Opening application..."
heroku open --app $APP_NAME

echo "✅ Deployment completed successfully!"
echo "🎉 Your app is now live at: https://$APP_NAME.herokuapp.com" 