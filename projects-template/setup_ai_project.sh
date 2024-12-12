#!/bin/bash

# Nome do projeto
PROJECT_NAME="rag_chatbot"

# Criando a estrutura de diretórios
echo "Criando a estrutura de diretórios para o projeto..."

mkdir -p $PROJECT_NAME/{data/{raw,processed,embeddings},src/{ingestion,embedding,retrieval,generation,api,monitoring,utils},notebooks,scripts,tests/{unit,integration,load},k8s,docs}

# Criando arquivos básicos
echo "Criando arquivos básicos..."

# Diretório src/ingestion
touch $PROJECT_NAME/src/ingestion/{pdf_parser.py,doc_cleaner.py}

# Diretório src/embedding
touch $PROJECT_NAME/src/embedding/{vectorizer.py,faiss_indexer.py}

# Diretório src/retrieval
touch $PROJECT_NAME/src/retrieval/{retriever.py,ranker.py}

# Diretório src/generation
touch $PROJECT_NAME/src/generation/{llm_client.py,rag_pipeline.py}

# Diretório src/api
touch $PROJECT_NAME/src/api/app.py

# Diretório src/monitoring
touch $PROJECT_NAME/src/monitoring/{health_check.py,metrics.py,alerts.py}

# Diretório src/utils
touch $PROJECT_NAME/src/utils/{config.py,logger.py,validators.py,helpers.py}

# Diretório notebooks
touch $PROJECT_NAME/notebooks/{data_exploration.ipynb,embedding_analysis.ipynb,pipeline_demo.ipynb}

# Diretório scripts
touch $PROJECT_NAME/scripts/{ingest_data.sh,run_tests.sh,deploy.sh}

# Diretório tests
touch $PROJECT_NAME/tests/unit/.gitkeep
touch $PROJECT_NAME/tests/integration/.gitkeep
touch $PROJECT_NAME/tests/load/.gitkeep

# Diretório k8s
touch $PROJECT_NAME/k8s/{deployment.yaml,service.yaml,configmap.yaml}

# Diretório docs
touch $PROJECT_NAME/docs/{README.md,architecture.md,api_reference.md,setup_guide.md}

# Arquivos na raiz do projeto
echo "Criando arquivos na raiz do projeto..."
touch $PROJECT_NAME/{docker-compose.yml,Dockerfile,.env.example,requirements.txt,pyproject.toml,Makefile}

# Mensagem de finalização
echo "Estrutura de projeto criada com sucesso em '$PROJECT_NAME'."
