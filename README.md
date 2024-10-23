# AzureStorage

Este projeto tem como objetivo apresentar os conceitos e a prática dos principais serviços de armazenamento da Azure. Ele abrange a criação e gerenciamento de diferentes tipos de armazenamento, como Blob Storage, File Share e Disk Storage, usando o **Azure Portal**, **Azure CLI** e **Terraform**.
#### Requisitos necessários:

Para criar devidamente sua VM, certifique-se de:
1. Instalar o **Terraform** na sua máquina local.
2. Configurar a **Azure CLI** para autenticação.

#### Instalação da Azure CLI

Caso não tenha instalado a Azure CLI, utilize o seguinte comando:

**Para rodar no Windows:**
```bash
winget install Microsoft.AzureCLI
```

**Para rodar no Linux:**
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

**Para rodar no MacOS:**
```bash
brew update && brew install azure-cli
```

Em seguida faça o login na Azure utilizando:

```bash
az login
```

Após executar `az login`, uma janela será aberta na Azure onde você deverá inserir suas credenciais. Caso você esteja usando o terminal, será solicitado que você insira um código para autenticação.
## Serviços de Armazenamento na Azure

### 1. Blob Storage
O **Azure Blob Storage** é um serviço para armazenar grandes quantidades de dados não estruturados, como imagens, vídeos e backups.

#### Criando Blob Storage pelo Portal da Azure

1. Acesse o [Azure Portal](https://portal.azure.com/).
2. No painel de navegação à esquerda, clique em **"Contas de Armazenamento"**.
3. Clique em **"Adicionar"** para criar uma nova conta de armazenamento.
4. Preencha as informações necessárias (nome, região, etc.) e clique em **"Revisar + criar"**.
5. Após a conta ser criada, acesse a conta de armazenamento e clique em **"Containers"** para criar um novo container.
6. Clique em **"Adicionar container"**, forneça um nome e clique em **"Criar"**.

#### Criando Blob Storage com Azure CLI

```bash
az group create --name rg-azure --location "Brazil South"

az storage account create --name mainStorageAccount --resource-group rg-azure --location "Brazil South" --sku Standard_LRS

az storage container create --name container --account-name mainStorageAccount
```

#### Criando Blob Storage com Terraform

Para criar o Blob Storage utilizando Terraform crie o arquivo .tf e desenvolva seu script, conforme o que se encontra neste projeto em `infra/blob_storage.tf` 

### 2. File Share
O **Azure File Share** é um sistema de arquivos em nuvem que pode ser montado em servidores locais ou em VMs no Azure.

#### Criando File Share pelo Portal da Azure

1. No Azure Portal, vá até **"Contas de Armazenamento"** e selecione a conta que deseja usar.
2. Clique em **"Compartilhamento de arquivos"**.
3. Clique em **"Adicionar compartilhamento de arquivos"** e forneça um nome e quota (em GB).
4. Clique em **"Criar"**.

#### Criando File Share com Azure CLI

```bash
az storage share create --name FileShare --account-name mainStorageAccount
```

#### Criando File Share com Terraform
Para criar o File Share utilizando Terraform crie o arquivo .tf e desenvolva seu script, assim como foi feito no primeiro processo, que se encontra também neste projeto em `infra/file_share.tf`

### 3. Disk Storage
O **Azure Managed Disk** é usado para armazenar discos permanentes que podem ser associados a máquinas virtuais.

#### Criando Disk Storage pelo Portal da Azure

1. No Azure Portal, vá até **"Discos"**.
2. Clique em **"Adicionar"** para criar um novo disco.
3. Preencha as informações necessárias (nome, tipo, etc.) e clique em **"Revisar + criar"**.
4. Clique em **"Criar"**.

#### Criando Disk Storage com Azure CLI

```bash
az disk create --resource-group mainResourceGroup --name myDisk --size-gb 10 --sku Premium_LRS --create-otion Empty
```

#### Criando Disk Storage com Terraform
Para criar o Disk Storage utilizando Terraform realize o mesmo processo dos demais:
- criar o arquivo .tf  conforme o que se encontra neste projeto em `infra/disk_storage.tf`


### 4. Tables
O **Azure Table Storage** é uma solução NoSQL ideal para armazenar grandes volumes de dados estruturados.

#### Criando Tables pelo Portal da Azure

1. No Azure Portal, acesse sua conta de armazenamento.
2. Clique em **"Tabelas"** e, em seguida, em **"Adicionar tabela"**.
3. Forneça um nome e clique em **"Criar"**.

#### Criando Tables com Azure CLI

```bash
az storage table create --name table --account-name mainStorageAccount
```

#### Criando Tables com Terraform

Para criar Tables utilizando Terraform segue o mesmo processo, criar um arquivo .tf seguindo o template presente em `infra/table_storage.tf` 

### Executando os scripts
Após realizar os scripts, seguir os passos abaixo:
1. Iniciar o Terraform
2. Planejar a infra (gera um plano de execução, a fim de verificar o que será criado)
3. Aplicar a configuração (neste passo, criará o tipo de Storage desejado)

#### Inicializar o Terraform
```bash
terraform init
```

#### Planejar a infra
```bash
terraform plan
```

#### Aplicar a configuração
```bash
terraform apply
```
## Monitoramento e Gerenciamento de Custo
A Azure oferece ferramentas poderosas para monitorar e gerenciar os custos associados aos seus serviços de armazenamento.

- **Azure Monitor**: Use o Azure Monitor para rastrear o desempenho de suas contas de armazenamento.
- **Azure Cost Management**: Ajuda a controlar e otimizar os custos, fornecendo relatórios detalhados.

# Atenção!
Diferente dos outros projetos que já apresentei, este é diferente, pois os storages não se completam necessariamente, o objetivo é apenas apresentar os principais serviços de Storage que a Azure oferece, para que assim você possa escolhar o ideal para o seu projeto!