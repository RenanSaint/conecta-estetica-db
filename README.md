# 💇‍♀️ Conecta Estética - Banco de Dados e Controle de Versão

Este repositório contém o modelo de dados, scripts SQL e documentação do módulo de **Banco de Dados e Controle de Versão** do projeto **Conecta Estética**, desenvolvido no âmbito do **Programa de Extensão UFMS Digital (95DX7.200525)**.

O **Conecta Estética** é uma aplicação voltada ao agendamento de serviços estéticos em comunidades, oferecendo aos profissionais autônomos uma ferramenta gratuita, acessível e organizada para gerenciar seus atendimentos.

---

## 🧠 Objetivo

Desenvolver e versionar um banco de dados relacional em **SQL** para a aplicação Conecta Estética, assegurando **integridade, escalabilidade** e **rastreabilidade** das alterações com o uso de **Git e GitHub**.

---

## 🧩 Modelagem do Banco de Dados

O modelo de dados segue o paradigma relacional, com entidades e relacionamentos definidos para atender ao fluxo de cadastro, agendamento e avaliação dos serviços.

**Entidades principais:**
- `Usuario` — armazena dados básicos de clientes e profissionais.  
- `Profissional` — registra especialidades e média de avaliações.  
- `Cliente` — armazena informações sobre os usuários que consomem serviços.  
- `Servico` — define os serviços oferecidos pelos profissionais.  
- `Agendamento` — controla as marcações de horário e status de cada atendimento.  
- `Avaliacao` — registra o feedback dos clientes após o serviço.

---

## 🧰 Tecnologias Utilizadas

- **PostgreSQL** — Sistema Gerenciador de Banco de Dados (SGBD)
- **SQL** — Linguagem de definição e manipulação de dados
- **Git & GitHub** — Controle de versão e colaboração
- **PlantUML** — Modelagem visual do diagrama ER

---

## 🚀 Como Executar o Banco de Dados

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/RenanSaint/conecta-estetica-db.git
   cd conecta-estetica-db
   ```

2. **Crie o banco no PostgreSQL:**
   ```sql
   CREATE DATABASE conecta_estetica;
   ```

3. **Execute o script de criação:**
   ```bash
   psql -U postgres -d conecta_estetica -f tables.sql
   ```

4. **Utilize o arquivo ```manipulation-examples.sql``` para popular o banco com dados de exemplo:**
   ```bash
   psql -U postgres -d conecta_estetica -f tables-operations.sql
   ```

5. **Teste consultas:**
   ```bash
   psql -U postgres -d conecta_estetica -f manipulation_examples.sql
   ```

---

## 🧩 Contribuição

Sinta-se à vontade para contribuir com melhorias, otimizações de consultas ou normalizações adicionais.

1. Crie uma nova branch:  
   ```bash
   git checkout -b feature/nome-da-sua-feature
   ```
2. Faça suas alterações e commit:  
   ```bash
   git commit -m "feat: adiciona nova view de estatísticas"
   ```
3. Envie o PR para revisão.

---

## 📎 Links Importantes

- **Repositório principal (frontend Angular):**  
  [https://github.com/RenanSaint/conecta-estetica](https://github.com/RenanSaint/conecta-estetica)

---

## 🧾 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

---

> **Desenvolvido por Renan Fonseca Santana**  
> Projeto de Extensão UFMS Digital • 2025.2  
> “Tecnologia e inclusão social conectando comunidades.”
