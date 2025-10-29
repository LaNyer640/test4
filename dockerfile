# 使用官方Python镜像作为基础镜像，选择3.11版本以满足项目要求
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 复制项目依赖文件
COPY requirements.txt .
COPY pyproject.toml .
COPY LICENSE .
COPY README.md .

# 复制项目源代码
COPY mcp_runcmd_server/ ./mcp_runcmd_server/

# 安装依赖
RUN pip install --no-cache-dir -r requirements.txt

# 暴露服务可能使用的端口（根据fastmcp默认端口或实际需求调整）
EXPOSE 4433

# 定义启动命令
CMD ["python", "-m", "mcp_runcmd_server.main"]
