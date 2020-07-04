# pip3 install whatever u need
from flask import Flask, request, jsonify
import pandas as pd
import numpy as np
import pickle

app = Flask(__name__)

heart_diease_prediction_model = pickle.load(
    open("heart_diease_prediction_model.sav", "rb")
)

cols = [
    "age",
    "sex",
    "cp",
    "trestbps",
    "chol",
    "fbs",
    "restecg",
    "thalach",
    "exang",
    "oldpeak",
    "slope",
    "ca",
    "thal",
]
input_list = []


@app.route("/api", methods=["GET"])
def heart_diease_prediction():
    d = {}
    input_list = str(request.args["Query"]).split(",")
    for index in range(len(input_list)):
        input_list[index] = int(input_list[index])

    my_input = pd.DataFrame(data=np.array([input_list]), columns=cols)
    d["Query"] = int(heart_diease_prediction_model.predict_proba(my_input)[0][1] * 100)
    return jsonify(d)


if __name__ == "__main__":
    app.run()
