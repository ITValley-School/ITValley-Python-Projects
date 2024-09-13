# Use uma imagem base oficial do Python
FROM python:3.11-slim

# Instala o compilador Rust
RUN apt-get update && apt-get install -y curl \
    && curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && . "$HOME/.cargo/env"

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo requirements.txt e instala as dependências
COPY requirements.txt .

# Instala as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código para o contêiner
COPY . .

# Define a variável de ambiente para desabilitar buffering de logs
ENV PYTHONUNBUFFERED=1

# Expõe a porta onde a aplicação será executada
EXPOSE 8501

# Define o comando para iniciar o Streamlit
CMD ["streamlit", "run", "scripto.ai/front_youtube_scripto.py"]

COPY it_valley.png /app/

