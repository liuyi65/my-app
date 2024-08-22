# 使用 Node.js 的官方镜像作为基础镜像
FROM node:16-alpine AS build

# 设置工作目录
WORKDIR /app

# 将 package.json 和 package-lock.json 复制到容器中
COPY package*.json ./

# 安装依赖
RUN npm install

# 将项目文件复制到容器中
COPY . .

# 打包前端项目
RUN npm run build

# 使用 Nginx 作为基础镜像来部署打包好的前端应用
FROM nginx:alpine

# 将打包好的文件从上一阶段的 build 镜像中复制到 Nginx 的默认目录
COPY --from=build /app/build /usr/share/nginx/html

# 暴露 Nginx 运行的端口
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]
