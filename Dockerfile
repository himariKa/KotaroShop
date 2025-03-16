FROM php:8.2-apache

# 必要なツールのインストール
RUN apt-get update && \
    apt-get install -y wget net-tools && \
    wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.0/xampp-linux-x64-8.2.0-0-installer.run/download -O xampp-installer.run && \
    chmod +x xampp-installer.run && \
    ./xampp-installer.run --mode unattended && \
    rm xampp-installer.run

# XAMPPのパスを追加
ENV PATH="/opt/lampp/bin:$PATH"

# XAMPPの起動と、プロセス維持のためのコマンド
CMD ["/bin/sh", "-c", "/opt/lampp/lampp start && tail -f /dev/null"]