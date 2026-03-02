# Face Mask Detection & Classification: Pipeline Clássico vs EfficientNetB0 (VOC)

Este repositório reúne um projeto completo de **Visão Computacional** para **detecção e classificação do uso de máscara em faces**, estruturado para permitir comparação direta entre duas abordagens sobre o **mesmo conjunto de dados**:

1. **Pipeline clássico (CV tradicional)**: detecção → recorte → extração de características → classificação → avaliação  
2. **Deep learning (transfer learning)**: recorte das faces → splits → treino de **EfficientNetB0** → avaliação com métricas robustas (ex.: **F1-macro**) e exemplos anotados

O dataset utilizado está em **formato PASCAL VOC** (imagens + anotações `.xml`) e foi obtido via Kaggle.

---

## Dataset

**Face Mask Detection Dataset (Kaggle)**  
Link: https://www.kaggle.com/datasets/andrewmvd/face-mask-detection/data

Estrutura original (VOC):
- `annotations/` (arquivos `.xml`)
- `images/` (arquivos `.png`)

> Por questões de tamanho e boas práticas de versionamento, o dataset **não é enviado para o GitHub** (está em `.gitignore`). Para reproduzir os resultados, faça o download via Kaggle e organize conforme a estrutura abaixo.

---

## Estrutura do projeto

```text
projeto_mascara/
  notebook/
    VC_Projeto1_FaceMask_Classical.ipynb
    VC_Projeto2_FaceMask_EfficientNet.ipynb
  data/
    raw/
      images/
      annotations/
    interim/
    processed/
  models/
  reports/
    figures/
  requirements.txt
  .gitignore
  README.md
  reset_project.ps1
```

### Convenção de pastas (recomendado)
- `data/raw/` — dataset original (VOC) após download e extração  
- `data/interim/` — artefatos intermediários (ex.: recortes, tabelas auxiliares)  
- `data/processed/` — dados prontos para treino/val/test (splits organizados)  
- `models/` — pesos/modelos treinados localmente (não versionado por padrão)  
- `reports/` — figuras e outputs de avaliação (opcional versionar apenas figuras finais)

---

## Notebooks

### Projeto 1 — Pipeline Clássico (Visão Computacional)
**Arquivo:** `notebook/VC_Projeto1_FaceMask_Classical.ipynb`

Objetivo: construir um baseline interpretável usando técnicas tradicionais.

Fluxo geral:
1. Leitura do dataset (VOC) e inspeção dos rótulos
2. Detecção de face / definição de ROI (quando aplicável)
3. Recorte das regiões de face (cropped) e comparação de cenários
4. Extração de características (features)
5. Treinamento de um classificador e avaliação

Resultados esperados:
- métricas comparativas entre estratégias (ex.: com/sem recorte)
- análises de erros e exemplos visuais (quando gerados)

---

### Projeto 2 — EfficientNetB0 com Transfer Learning
**Arquivo:** `notebook/VC_Projeto2_FaceMask_EfficientNet.ipynb`

Objetivo: implementar deep learning sobre o mesmo conjunto de imagens, com pipeline reprodutível.

Fluxo geral:
1. Leitura das anotações VOC e recorte automático das faces via bounding boxes
2. Organização dos dados em **treino / validação / teste**
3. Treinamento de **EfficientNetB0** com **transfer learning**
4. Avaliação com métricas apropriadas (incluindo **F1-macro**)
5. Geração de exemplos anotados para comparação qualitativa

---

## Instalação e execução

### 1) Criar ambiente virtual (recomendado)

**Windows (PowerShell):**
```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

**Linux/macOS:**
```bash
python3 -m venv .venv
source .venv/bin/activate
```

### 2) Instalar dependências
```bash
pip install -r requirements.txt
```

---

## Como preparar o dataset

1. Faça download no Kaggle:
   - https://www.kaggle.com/datasets/andrewmvd/face-mask-detection/data

2. Extraia e organize para ficar assim:
```text
data/raw/
  images/
    *.png
  annotations/
    *.xml
```

> Se você baixar a pasta com outro nome (ex.: `Face Mask Detection/`), mova `images/` e `annotations/` para dentro de `data/raw/`.

---

## Como reproduzir

1. Abra o Jupyter Notebook / VSCode
2. Execute os notebooks conforme o objetivo:
   - `VC_Projeto1_FaceMask_Classical.ipynb` (baseline clássico)
   - `VC_Projeto2_FaceMask_EfficientNet.ipynb` (deep learning)

Sugestão: rode primeiro o Projeto 1 para estabelecer baseline e depois o Projeto 2 para comparar resultados.

---

## Versionamento (importante)

Por padrão este repositório **não versiona**:
- `data/` (dataset)
- `models/` (pesos/modelos treinados localmente)

Isso evita repositório pesado e mantém o projeto reprodutível. Caso você queira publicar resultados, a prática mais comum é versionar apenas:
- `README.md`
- notebooks/código
- algumas figuras finais leves em `reports/figures/`

---

## Referências e créditos

- Dataset: **Face Mask Detection Dataset** (Kaggle)  
  https://www.kaggle.com/datasets/andrewmvd/face-mask-detection/data
- EfficientNet / Transfer Learning (bibliotecas utilizadas no notebook conforme dependências do `requirements.txt`)