### Carregando o pacote mlbench e caret
library(mlbench)  
library(caret)
# 1 Pesquisa com Dados de Satélite (Satellite)
# Tarefas:
## 1. Carregue a base de dados Satellite
### Carregando a base de dados Satellite
data(Satellite)
Satellite

## 2. Crie par2ções contendo 80% para treino e 20% para teste
### Definindo a semente aleatória para reproducibilidade
set.seed(123)

### Criando índices aleatórios para divisão de treino/teste (80% treino, 20% teste)
indices <- sample(1:nrow(Satellite), size = nrow(Satellite) * 0.8, replace = FALSE)
train_data <- Satellite[indices, ]
test_data <- Satellite[-indices, ]
train_data
test_data

## 3. Treine modelos RandomForest, SVM e RNA para predição destes dados.
### Definindo o controle de treinamento para cross-validation
train_control <- trainControl(method = "cv", number = 5)

### Treinando o modelo RandomForest
model_rf <- train(classes ~ ., data = train_data, method = "rf", trControl = train_control)

### Treinando o modelo SVM (SVM linear neste exemplo)
model_svm <- train(classes ~ ., data = train_data, method = "svmLinear", trControl = train_control)

### Treinando o modelo RNA (rede neural artificial)
### aqui tem erro: model_nn <- train(classes ~ ., data = train_data, method = "neuralnet", trControl = train_control)

## 4. Escolha o melhor modelo com base em suas matrizes de confusão.
# Previsões dos modelos nos dados de teste
predictions_rf <- predict(model_rf, newdata = test_data)
predictions_svm <- predict(model_svm, newdata = test_data)
### corrigir modelo RNA: predictions_nn <- predict(model_nn, newdata = test_data)

# Avaliar as matrizes de confusão
confusion_rf <- confusionMatrix(predictions_rf, test_data$class)
confusion_svm <- confusionMatrix(predictions_svm, test_data$class)
### corrigir modelo RNA: confusion_nn <- confusionMatrix(predictions_nn, test_data$class)

# Exibir as matrizes de confusão
confusion_rf
confusion_svm
### corrigir modelo RNA: confusion_nn



## 5. Indique qual modelo dá o melhor o resultado e a métrica utilizada

# 2 Estimativa de Volumes de Árvores
# Tarefas
## 1. Carregar o arquivo Volumes.csv (http://www.razer.net.br/datasets/Volumes.csv)


## 2. Eliminar a coluna NR, que só apresenta um número sequencial


## 3. Criar partição de dados: treinamento 80%, teste 20%


## 4. Usando o pacote "caret", treinar os modelos: Random Forest (rf), SVM (svmRadial), Redes
## Neurais (neuralnet) e o modelo alométrico de SPURR
## * O modelo alométrico é dado por: Volume = b0 + b1 * dap2 * Ht
## alom <- nls(VOL ~ b0 + b1*DAP*DAP*HT, dados, start=list(b0=0.5, b1=0.5))


## 5. Efetue as predições nos dados de teste


## 6. Crie suas próprias funções (UDF) e calcule as seguintes métricas entre a predição e os dados
## observados
## * Coeficiente de determinação: R2


## Erro padrão da estimativa: Syx


## Syx%


## 7. Escolha o melhor modelo.



