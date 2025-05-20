import cv2
import numpy as np
import onnxruntime as ort
import time

IMAGE_PATH = "test.jpg"
MODEL_PATH = "yolov5s.onnx"
LABELS_PATH = "coco.names"

CONF_THRESHOLD = 0.25
NMS_THRESHOLD = 0.45
INPUT_SIZE = 640

# Load class labels
with open(LABELS_PATH, 'r') as f:
    CLASS_NAMES = [line.strip() for line in f.readlines()]

# Load image
original = cv2.imread(IMAGE_PATH)
if original is None:
    raise FileNotFoundError(f"❌ Failed to load image: {IMAGE_PATH}")
h0, w0 = original.shape[:2]

# Preprocess
img = cv2.resize(original, (INPUT_SIZE, INPUT_SIZE))
img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB).astype(np.float32) / 255.0
img = img.transpose(2, 0, 1)
img = np.expand_dims(img, 0)

# Enable profiling and try GPU, fallback to CPU
so = ort.SessionOptions()
so.enable_profiling = True

try:
    providers = ["CUDAExecutionProvider", "CPUExecutionProvider"]
    available = ort.get_available_providers()
    session = ort.InferenceSession(
        MODEL_PATH,
        sess_options=so,
        providers=[p for p in providers if p in available]
    )
except Exception as e:
    print(f"⚠️ Falling back to CPU due to error: {e}")
    session = ort.InferenceSession(MODEL_PATH, providers=["CPUExecutionProvider"])

print("Running providers:", session.get_providers())

# Inference with timing
input_name = session.get_inputs()[0].name
start = time.time()
outputs = session.run(None, {input_name: img})[0]
inference_time = time.time() - start
print(f"⏱ Inference time: {inference_time:.3f} seconds")

# Save ONNX profiling data
profile_file = session.end_profiling()
print(f"📊 Profiling output saved to: {profile_file}")

# Postprocess
boxes, confidences, class_ids = [], [], []
scale_x, scale_y = w0 / INPUT_SIZE, h0 / INPUT_SIZE

for det in outputs[0]:
    confidence = det[4]
    if confidence > CONF_THRESHOLD:
        class_scores = det[5:]
        class_id = np.argmax(class_scores)
        score = class_scores[class_id] * confidence
        if score > CONF_THRESHOLD:
            cx, cy, w, h = det[:4]
            x1 = int((cx - w / 2) * scale_x)
            y1 = int((cy - h / 2) * scale_y)
            x2 = int((cx + w / 2) * scale_x)
            y2 = int((cy + h / 2) * scale_y)
            boxes.append([x1, y1, x2 - x1, y2 - y1])
            confidences.append(float(score))
            class_ids.append(class_id)

indices = cv2.dnn.NMSBoxes(boxes, confidences, CONF_THRESHOLD, NMS_THRESHOLD)

# Draw detections and find largest
biggest_area = 0
biggest_center = None

for i in indices.flatten():
    x, y, w, h = boxes[i]
    cx = x + w // 2
    cy = y + h // 2
    area = w * h
    if area > biggest_area:
        biggest_area = area
        biggest_center = (cx, cy)
    label = f"{CLASS_NAMES[class_ids[i]]}: {confidences[i]:.2f}"
    cv2.rectangle(original, (x, y), (x + w, y + h), (0, 255, 0), 2)
    cv2.putText(original, label, (x, y - 10),
                cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 255, 255), 2)

# Print center offset
if biggest_center:
    rel_x = biggest_center[0] - (w0 // 2)
    rel_y = biggest_center[1] - (h0 // 2)
    print(f"🧭 Largest object center: x={rel_x}, y={rel_y} (image center as 0,0)")

cv2.imwrite("result.jpg", original)
print("✅ Saved result.jpg with YOLO detections")

