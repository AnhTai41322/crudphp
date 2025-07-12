# 🚀 Deploy Laravel AJAX CRUD Modal

## ⚡ Deploy Nhanh (Khuyến nghị)

### Heroku (Miễn phí - Dễ nhất)
```bash
# 1. Cài Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli
# 2. Đăng nhập
heroku login

# 3. Chạy script deploy tự động
chmod +x deploy.sh
./deploy.sh
```

### Railway (Miễn phí $5/tháng)
1. Truy cập https://railway.app
2. Đăng ký bằng GitHub
3. Tạo project → Deploy from GitHub
4. Thêm MySQL service
5. Chạy: `railway run php artisan migrate`

### Render (Miễn phí 750h/tháng)
1. Truy cập https://render.com
2. Tạo Web Service
3. Connect GitHub repo
4. Build Command: `composer install --no-dev --optimize-autoloader`
5. Start Command: `php artisan serve --host 0.0.0.0 --port $PORT`

### 000webhost (Hoàn toàn miễn phí)
1. Truy cập https://000webhost.com
2. Tạo tài khoản miễn phí
3. Upload files qua File Manager
4. Cấu hình database trong cPanel

## 📋 Yêu cầu trước khi deploy

- [ ] Code đã được test trên local
- [ ] Database migration đã sẵn sàng
- [ ] Environment variables đã được cấu hình
- [ ] Git repository đã được tạo

## 🔧 Cấu hình cần thiết

### Environment Variables
```env
APP_ENV=production
APP_DEBUG=false
APP_KEY=base64:your-key-here
DB_CONNECTION=mysql
CACHE_DRIVER=file
SESSION_DRIVER=file
QUEUE_DRIVER=sync
```

### Database
- MySQL hoặc PostgreSQL
- Chạy migration sau khi deploy
- Backup data nếu cần

## 📖 Hướng dẫn chi tiết

Xem file `DEPLOYMENT_GUIDE.md` để có hướng dẫn đầy đủ cho từng platform.

## 🆘 Troubleshooting

### Lỗi thường gặp:
1. **Database connection failed**
   - Kiểm tra DATABASE_URL
   - Chạy migration: `php artisan migrate`

2. **500 Internal Server Error**
   - Kiểm tra logs: `heroku logs --tail`
   - Đặt APP_DEBUG=true tạm thời

3. **Permission denied**
   - Chạy: `chmod -R 755 storage bootstrap/cache`

### Commands hữu ích:
```bash
# Xem logs
heroku logs --tail

# Chạy artisan commands
heroku run php artisan migrate

# Kiểm tra config
heroku config

# Restart app
heroku restart
```

## 🎯 Kết quả

Sau khi deploy thành công, bạn sẽ có:
- ✅ Website live trên internet
- ✅ Database hoạt động
- ✅ AJAX CRUD operations
- ✅ Responsive design
- ✅ Bootstrap UI

**Chúc bạn deploy thành công! 🎉** 