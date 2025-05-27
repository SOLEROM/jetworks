# use python3 ;  pip install onnx
import onnx, sys

model = onnx.load(sys.argv[1])
for imp in model.opset_import:
    domain = imp.domain if imp.domain else "ai.onnx"
    print(f"{domain}: opset {imp.version}")