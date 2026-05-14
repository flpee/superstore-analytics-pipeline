# Superstore Analytics Pipeline

Projeto completo de análise de dados utilizando Python, SQL Server e Power BI, com foco em transformar dados comerciais da base Superstore em insights estratégicos sobre vendas, lucro, descontos, operação logística e desempenho geográfico.

## Objetivo

Construir um pipeline analítico completo, desde a exploração e tratamento dos dados até a modelagem em SQL Server e visualização em Power BI.

O projeto busca responder perguntas como:

- Quais categorias e subcategorias geram maior receita e lucro?
- Quais regiões e estados apresentam melhor desempenho?
- Existe relação entre modo de envio, prazo de entrega e rentabilidade?
- Quais produtos concentram maior prejuízo?

## Tecnologias utilizadas

| Camada | Tecnologias |
|---|---|
| 📥 Extração de Dados & ETL | Python, Pandas, SQLAlchemy |
| 🗄️ Banco de dados | SQL Server |
| 📊 Análise e visualização | Power BI, DAX, Power Query |
| 📈 Business Intelligence | KPI Modeling, Analytical Views |

## Pipeline

```mermaid
flowchart LR
    A[📄 CSV Raw Data] --> B[🐍 Python ETL & Cleaning]
    B --> C[🗄️ SQL Server]
    C --> D[📊 Analytical Views]
    D --> E[📈 Power BI Dashboard]
    E --> F[💡 Business Insights]
```
