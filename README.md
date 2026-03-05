# Sistema de Gestão de Reservas (Restaurant Reservation System)

Um sistema de back-end estruturado para o gerenciamento de reservas em múltiplos restaurantes, projetado com foco em fundamentos de engenharia de software, modelagem relacional e controle transacional.

## 🎯 Sobre o Projeto

O principal objetivo arquitetural deste projeto é o aprofundamento prático na manipulação de dados e gerenciamento de memória. Por isso, a camada de persistência foi construída **sem a utilização de ORMs** (como Entity Framework), optando pelo uso de **ADO.NET** com queries SQL nativas. Isso garante um controle refinado sobre o ciclo de vida das conexões (`IDisposable`), prevenção de *SQL Injection* via parâmetros e previsibilidade na execução no banco de dados.

## 🛠 Tecnologias Utilizadas

- **Linguagem:** C# / .NET 9
- **Banco de Dados:** Microsoft SQL Server 2022
- **Infraestrutura / Deploy:** Docker & Docker Compose
- **Acesso a Dados:** ADO.NET (Comandos Nativos)

## 🗄️ Modelagem de Dados e Normalização

O banco de dados foi normalizado para suportar o histórico de transações, separando as entidades físicas dos eventos no tempo. O relacionamento resolve a lógica de posse de mesas, permitindo que um cliente reserve múltiplas mesas e que uma mesa receba múltiplos clientes em horários diferentes.

- **Clientes:** Gerenciamento de usuários.
- **Restaurantes:** Unidades físicas da rede (Norte, Sul, Leste, Oeste, Central).
- **Mesas:** Entidades atreladas aos restaurantes (Relação 1:N).
- **Reservas:** Tabela transacional que une as chaves de `Cliente` e `Mesa` em um DateTime específico.

## 🚀 Como Executar Localmente

### Pré-requisitos
Para rodar este projeto, você precisará ter instalado em sua máquina:
- [.NET 9 SDK](https://dotnet.microsoft.com/download/dotnet/9.0)
- [Docker](https://www.docker.com/) e Docker Compose

### Passos para Instalação

1. Clone este repositório:
   ```bash
   git clone [https://github.com/SEU-USUARIO/restaurante.git](https://github.com/SEU-USUARIO/restaurante.git)
   cd restaurante