import tensorflow as tf

# 学習済みモデルをロード
model = tf.keras.models.load_model("gunshot_model.h5")

# Keras → TFLite 変換
converter = tf.lite.TFLiteConverter.from_keras_model(model)
tflite_model = converter.convert()

# ファイル出力
with open("gunshot_model.tflite", "wb") as f:
    f.write(tflite_model)