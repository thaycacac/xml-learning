# XML Learning

## XML Project: SharpShop

1. Xây dựng một website bán hàng mà trong đó XML đóng vai trò chủ đạo trong việc trao đổi thông
tin. Website có các chức năng cơ bản như sau:
a. Trang thông tin sản phẩm/dịch vụ
b. Trang thông tin chi tiết về sản phẩm/dịch vụ
c. Trang order sản phẩm/dịch vụ
d. Thống kê các sản phẩm/dịch vụ đã được order
Tạo một webservice kết nối tới database và trả về/tiếp nhận các request thông qua XML. Xây
dựng website bán hàng mà các chức năng cho ở trên được thực hiện thông qua việc gọi các
service đã xây dựng.

### How to use

#### Backend

Edit server connection in **appsettings.json**

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=DESKTOP-G4NBSB1;Database=TODOLIST;ConnectRetryCount=0;Trusted_Connection=True;MultipleActiveResultSets=true"
}
```
Edit applicationUrl in **Properties/launchSettings.json**

```json
"applicationUrl": "http://localhost:7985/"
```

Then build IIS Express

#### Frontend

Build Setup

``` bash
# install dependencies
npm install // yarn

# serve with hot reload at localhost:8080
npm run dev // yarn dev

# build for production with minification
npm run build // yarn build
```

### Demo

![Demo 1](https://github.com/thaycacac/xml-learning/blob/master/project/other/images/1.PNG?raw=true)

![Demo 2](https://github.com/thaycacac/xml-learning/blob/master/project/other/images/3.PNG?raw=true)

![Demo 3](https://github.com/thaycacac/xml-learning/blob/master/project/other/images/4.PNG?raw=true)
