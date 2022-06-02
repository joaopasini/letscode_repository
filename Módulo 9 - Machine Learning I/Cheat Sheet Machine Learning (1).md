## Estimadores de Classificação

- Regressão Logística
- Regressão Logística com multiplas variáveis
- KNN

## Estimadores de Regressão

- Regressão Linear
- Regularização Lasso (L1)
- Regularização Ridge (L2)
- ElasticNet


## Estimadores fortemente relacionados com a distância dos dados

- Regressão Linear
- Regressão Logística
- Regularização Lasso (L1)
- Regularização Lasso (L2)
- Elastic Net
- KNN

## Remoção de Outliers

A remoção de Outliers é um processo bastante importante nos processos de Ciência de Dados, entretanto, a remoção imediata de outliers não é uma boa prática. 

É importante antes entendermos o dado em questão. Mais detalhes neste [post](https://datascience.stackexchange.com/questions/42952/should-i-remove-outliers-if-accuracy-and-cross-validation-score-drop-after-remov) (recomenda-se ler a primeira resposta)

## Avaliando métricas

As métricas devem sempre ser avaliadas em função das regras de negócio, entretanto, como no curso não possuímos noção completa das regras das bases que estamos estudando, adotaremos a seguinte convenção:

### Métricas percentuais

Para métricas percentuais, avaliaremos que estas estão adequadas quando estiverem acima de **80%**. São exemplos metricas percentuais:

- R²
- Roc-Auc
- Acurácia
- Precisão
- Recall
- F1-Score