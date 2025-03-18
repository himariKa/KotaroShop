FROM php:8.2-apache

# パッケージの更新
RUN apt-get clean && apt-get update -y || { echo "apt-get update failed"; exit 1; }

# 32ビットアーキテクチャのサポートを追加
RUN dpkg --add-architecture i386 && apt-get update -y

# 必要なツールのインストール
RUN apt-get install -y wget net-tools libc6 libstdc++6:i386 curl

# XAMPPのダウンロードとインストール
RUN curl -L "https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run/download?use_mirror=jaist" -o /opt/xampp-installer.run && \
    chmod +x /opt/xampp-installer.run && \
    /opt/xampp-installer.run --mode unattended && \
    rm /opt/xampp-installer.run

# staffとproductディレクトリをコピー
COPY ./src/staff /opt/lampp/htdocs/staff
COPY ./src/product /opt/lampp/htdocs/product

# XAMPPのパスを追加
ENV PATH="/opt/lampp/bin:$PATH"

# XAMPPの起動とプロセス維持のためのコマンド
CMD ["/bin/sh", "-c", "/opt/lampp/lampp start && tail -f /dev/null"]