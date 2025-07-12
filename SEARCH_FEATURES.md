# 🔍 Chức năng Search Sản phẩm

## ✨ Tính năng đã thêm

### 1. **Search Real-time với AJAX**
- Tìm kiếm ngay khi gõ (debounce 500ms)
- Không cần reload trang
- Hiển thị loading indicator

### 2. **Search đa tiêu chí**
- Tìm theo tên sản phẩm
- Tìm theo giá
- Tìm kiếm không phân biệt hoa thường

### 3. **Highlight kết quả**
- Tô sáng từ khóa tìm kiếm
- Hiển thị số lượng kết quả
- Thông báo khi không tìm thấy

### 4. **UI/UX đẹp**
- Panel search với gradient
- Animation loading
- Responsive design
- Hover effects

## 🚀 Cách sử dụng

### Search cơ bản:
1. Nhập từ khóa vào ô tìm kiếm
2. Kết quả hiển thị tự động sau 0.5s
3. Hoặc nhấn nút "Tìm kiếm"

### Search nâng cao:
- **Tìm theo tên**: "iPhone", "Samsung", "MacBook"
- **Tìm theo giá**: "999", "1999", "129"
- **Tìm kết hợp**: "iPhone 999"

### Các nút chức năng:
- **🔍 Tìm kiếm**: Thực hiện search
- **🔄 Làm mới**: Xóa search, hiển thị tất cả sản phẩm

## 🛠️ Cấu trúc code

### Backend (Laravel):
```php
// ProductController.php
public function search(Request $request)
{
    $search = $request->get('search');
    
    $products = DB::table('products')
                 ->when($search, function($query) use ($search) {
                     return $query->where('name', 'LIKE', '%' . $search . '%')
                                 ->orWhere('price', 'LIKE', '%' . $search . '%');
                 })
                 ->where('id', '>', 0)
                 ->get();
                 
    return response()->json($products);
}
```

### Frontend (JavaScript):
```javascript
// ajaxscript.js
function performSearch() {
    var searchTerm = $('#search-input').val().trim();
    
    $.ajax({
        type: "GET",
        url: url + '/search',
        data: { search: searchTerm },
        success: function (data) {
            displaySearchResults(data, searchTerm);
        }
    });
}
```

### CSS Styling:
```css
/* search.css */
.search-panel {
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.highlight {
    background-color: #ffff99 !important;
    padding: 2px 4px;
    border-radius: 3px;
    font-weight: bold;
}
```

## 📁 Files đã thêm/sửa

### Files mới:
- `public/css/search.css` - CSS cho search UI
- `database/seeds/ProductSeeder.php` - Demo data
- `SEARCH_FEATURES.md` - Hướng dẫn này

### Files đã sửa:
- `app/Http/Controllers/ProductController.php` - Thêm method search()
- `routes/web.php` - Thêm route search
- `resources/views/index.blade.php` - UI search
- `public/js/ajaxscript.js` - JavaScript search
- `database/seeds/DatabaseSeeder.php` - Include ProductSeeder

## 🧪 Testing

### Chạy seeder để có dữ liệu test:
```bash
php artisan db:seed
```

### Test cases:
1. **Search tên sản phẩm**: "iPhone", "Samsung"
2. **Search giá**: "999", "1999"
3. **Search không có kết quả**: "xyz123"
4. **Search rỗng**: Xóa hết text
5. **Search real-time**: Gõ từng ký tự

## 🎯 Kết quả mong đợi

### Khi search thành công:
- ✅ Hiển thị loading indicator
- ✅ Kết quả được highlight
- ✅ Hiển thị số lượng kết quả
- ✅ Ẩn pagination khi search

### Khi không có kết quả:
- ✅ Hiển thị thông báo "Không tìm thấy"
- ✅ Ẩn bảng sản phẩm
- ✅ Ẩn pagination

### Khi xóa search:
- ✅ Hiển thị lại tất cả sản phẩm
- ✅ Hiển thị lại pagination
- ✅ Ẩn thông báo search

## 🔧 Tùy chỉnh

### Thêm trường search:
```php
// Trong ProductController@search
->where('name', 'LIKE', '%' . $search . '%')
->orWhere('price', 'LIKE', '%' . $search . '%')
->orWhere('description', 'LIKE', '%' . $search . '%') // Thêm trường mới
```

### Thay đổi debounce time:
```javascript
// Trong ajaxscript.js
setTimeout(function() {
    performSearch();
}, 300); // Thay đổi từ 500ms thành 300ms
```

### Thay đổi style:
```css
/* Trong search.css */
.highlight {
    background-color: #ffeb3b !important; /* Thay đổi màu highlight */
}
```

## 🚀 Deploy

Sau khi thêm chức năng search, bạn có thể deploy lên server như bình thường:

```bash
# Chạy migration và seeder
php artisan migrate
php artisan db:seed

# Deploy lên Heroku
./deploy.sh
```

**Chức năng search đã hoàn thành! 🎉** 