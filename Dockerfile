# Sử dụng Node.js phiên bản nhẹ
FROM node:18-alpine

# Set thư mục làm việc trong container
WORKDIR /app

# Copy file package.json và package-lock.json
COPY package.json package-lock.json ./

# Cài đặt dependencies
RUN npm install

# Copy toàn bộ source code vào container
COPY . .

# Build Next.js (chỉ cần khi chạy production)
RUN npm run build

# Port container sẽ chạy
EXPOSE ${PORT}

# Lệnh chạy ứng dụng
CMD ["npm", "run", "start"]

