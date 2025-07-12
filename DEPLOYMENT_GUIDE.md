# Hướng dẫn Deploy Laravel AJAX CRUD Modal

## 🚀 Các Server Miễn Phí Khuyến Nghị

### 1. **Heroku** (Khuyến nghị nhất)
- **Ưu điểm**: Dễ deploy, ổn định, hỗ trợ PHP/Laravel tốt
- **Giới hạn**: 550-1000 dyno hours/tháng (miễn phí)
- **Database**: MySQL addon (miễn phí tier)

### 2. **Railway**
- **Ưu điểm**: Deploy nhanh, giao diện đẹp
- **Giới hạn**: $5 credit/tháng
- **Database**: MySQL/PostgreSQL

### 3. **Render**
- **Ưu điểm**: 750 hours/tháng miễn phí
- **Database**: PostgreSQL miễn phí

### 4. **000webhost**
- **Ưu điểm**: Hoàn toàn miễn phí, không cần thẻ tín dụng
- **Nhược điểm**: Giao diện cũ, ít tính năng

---

## 📋 Deploy lên Heroku (Hướng dẫn chi tiết)

### Bước 1: Chuẩn bị
```bash
# Cài đặt Heroku CLI
# Windows: https://devcenter.heroku.com/articles/heroku-cli

# Đăng nhập Heroku
heroku login

# Tạo Git repository (nếu chưa có)
git init
git add .
git commit -m "Initial commit"
```

### Bước 2: Tạo ứng dụng Heroku
```bash
# Tạo app mới
heroku create your-app-name

# Hoặc deploy từ GitHub
# 1. Push code lên GitHub
# 2. Kết nối GitHub với Heroku
# 3. Enable automatic deploys
```

### Bước 3: Cấu hình Environment Variables
```bash
# Set các biến môi trường
heroku config:set APP_ENV=production
heroku config:set APP_DEBUG=false
heroku config:set APP_KEY=$(php artisan key:generate --show)
heroku config:set DB_CONNECTION=mysql
heroku config:set CACHE_DRIVER=file
heroku config:set SESSION_DRIVER=file
heroku config:set QUEUE_DRIVER=sync
```

### Bước 4: Thêm Database
```bash
# Thêm MySQL addon (miễn phí)
heroku addons:create heroku-mysql:mini

# Kiểm tra database URL
heroku config:get DATABASE_URL
```

### Bước 5: Deploy
```bash
# Deploy code
git push heroku main

# Chạy migration
heroku run php artisan migrate --force

# Mở ứng dụng
heroku open
```

---

## 🚀 Deploy lên Railway

### Bước 1: Đăng ký Railway
1. Truy cập https://railway.app
2. Đăng ký bằng GitHub
3. Tạo project mới

### Bước 2: Deploy
1. Chọn "Deploy from GitHub repo"
2. Chọn repository của bạn
3. Railway sẽ tự động detect Laravel và deploy

### Bước 3: Cấu hình Database
1. Thêm MySQL service
2. Railway sẽ tự động set DATABASE_URL
3. Chạy migration: `railway run php artisan migrate`

---

## 🌐 Deploy lên Render

### Bước 1: Tạo Web Service
1. Đăng ký tại https://render.com
2. Tạo "Web Service"
3. Connect GitHub repository

### Bước 2: Cấu hình
- **Build Command**: `composer install --no-dev --optimize-autoloader`
- **Start Command**: `php artisan serve --host 0.0.0.0 --port $PORT`
- **Environment**: PHP

### Bước 3: Environment Variables
```
APP_ENV=production
APP_DEBUG=false
APP_KEY=base64:your-key-here
DB_CONNECTION=mysql
```

---

## 🆓 Deploy lên 000webhost

### Bước 1: Đăng ký
1. Truy cập https://000webhost.com
2. Tạo tài khoản miễn phí
3. Tạo website mới

### Bước 2: Upload Files
1. Upload toàn bộ code qua File Manager
2. Cấu hình database trong cPanel
3. Chỉnh sửa `.env` file

### Bước 3: Cấu hình
```env
APP_ENV=production
APP_DEBUG=false
DB_HOST=localhost
DB_DATABASE=your_database
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

---

## ⚠️ Lưu ý Quan Trọng

### 1. **Security**
- Đặt `APP_DEBUG=false` trong production
- Generate `APP_KEY` mới
- Không commit `.env` file

### 2. **Database**
- Backup database trước khi deploy
- Test migration trên local trước
- Kiểm tra database connection

### 3. **Performance**
- Enable caching: `php artisan config:cache`
- Optimize autoloader: `composer install --optimize-autoloader --no-dev`
- Clear cache sau deploy: `php artisan cache:clear`

### 4. **Troubleshooting**
```bash
# Xem logs
heroku logs --tail

# Chạy artisan commands
heroku run php artisan migrate

# Kiểm tra config
heroku config
```

---

## 🔧 Tùy chỉnh cho từng server

### Heroku
- File `Procfile` đã được tạo
- File `app.json` cho configuration
- Sử dụng `DATABASE_URL` environment variable

### Railway
- Tự động detect Laravel
- Sử dụng `DATABASE_URL`
- Hỗ trợ custom domains

### Render
- Cần cấu hình build và start commands
- Hỗ trợ custom domains
- Auto-scaling available

### 000webhost
- Manual upload required
- Limited PHP extensions
- Shared hosting limitations

---

## 📞 Hỗ trợ

Nếu gặp vấn đề, hãy kiểm tra:
1. Logs của server
2. Laravel logs: `storage/logs/laravel.log`
3. Database connection
4. Environment variables
5. File permissions

**Chúc bạn deploy thành công! 🎉** 