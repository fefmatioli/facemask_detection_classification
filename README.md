# Como usar
1.Baixe o dataset do Kaggle Face Mask Detection (Andrew MVD) (https://www.kaggle.com/datasets/andrewmvd/face-mask-detection/data);
2. Extraia em `data/raw/` com a estrutura `images/` e `annotations/` (VOC XML);  
3. No terminal: 
    python -m venv .venv
    .\.venv\Scripts\Activate
    pip install --upgrade pip
    pip install -r .\requirements.txt
4. Rode os notebooks;
5. As figuras sairão em `reports/figures/`.