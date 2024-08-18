
nohup /opt/minio/minio server  /opt/minio/data --address ":9090" --console-address ":9999" > /opt/minio/minio.log 2>&1 &
