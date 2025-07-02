# Use uma imagem oficial do Python como imagem pai
FROM python:3.10-slim

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências
# --no-cache-dir: Desativa o cache, o que reduz o tamanho da imagem
# --upgrade pip: Garante que temos a versão mais recente do pip
RUN pip install --no-cache-dir --upgrade pip -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Comando para executar a aplicação
# --host 0.0.0.0 torna a aplicação acessível de fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]