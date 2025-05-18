import librosa
import numpy as np
import os
from sklearn.model_selection import train_test_split

def extract_mfcc(file_path):
    y, sr = librosa.load(file_path, sr=16000)
    mfcc = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=13)
    return np.mean(mfcc.T, axis=0)  # 平均で次元圧縮

X, y = [], []
for label, folder in enumerate(['gunshot', 'noise']):
    files = os.listdir(f'dataset/{folder}')
    for file in files:
        mfcc = extract_mfcc(f'dataset/{folder}/{file}')
        X.append(mfcc)
        y.append(label)

X = np.array(X)
y = np.array(y)

# 学習データ分割
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)